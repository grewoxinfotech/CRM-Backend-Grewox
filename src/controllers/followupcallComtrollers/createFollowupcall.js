import FollowupCall from "../../models/followupCallModel.js";
import responseHandler from "../../utils/responseHandler.js";
import Joi from "joi";
import validator from "../../utils/validator.js";
import Notification from "../../models/notificationModel.js";

export default {
    validator: validator({
        params: Joi.object({
            id: Joi.string().required()
        }),
        body: Joi.object({
            subject: Joi.string().required(),
            call_start_date: Joi.string().required(),
            call_duration: Joi.string().optional(),
            call_start_time: Joi.string().required(),
            call_end_time: Joi.string().optional(),
            call_reminder: Joi.string().optional().allow(null),
            assigned_to: Joi.object({
                assigned_to: Joi.array().items(Joi.string()).required()
            }).required(),
            call_purpose: Joi.string().optional().allow(null),
            call_notes: Joi.string().optional().allow(null),
            call_type: Joi.string().required(),
            call_status: Joi.string().optional().allow(null)
        })
    }),

    handler: async (req, res) => {
        try {
            const { id } = req.params;
            const callData = req.body;

            // Set default status if not provided
            if (!callData.call_status) {
                callData.call_status = 'not_started';
            }

            // Create the call with all fields from model
            const call = await FollowupCall.create({
                ...callData,
                client_id: req.des?.client_id,
                related_id: id,
                created_by: req.user?.username
            });

            // Create notification for assigned users with status info
            for (const assignedUser of callData.assigned_to.assigned_to) {
                await Notification.create({
                    related_id: call.id,
                    users: [assignedUser],
                    title: "New Call Assignment",
                    from: req.user?.id,
                    client_id: req.des?.client_id,
                    message: `You have been assigned to a new call: ${callData.subject}`,
                    description: `📞 Call Details:
• Subject: ${callData.subject}
• Date: ${callData.call_start_date}
• Time: ${callData.call_start_time}
• Purpose: ${callData.call_purpose || 'N/A'}
• Status: ${callData.call_status}`,
                    created_by: req.user?.username,
                });

                // Calculate reminder time based on call_reminder
                if (callData.call_reminder) {
                    const [hours, minutes] = callData.call_start_time.split(':');
                    const reminderDate = new Date(callData.call_start_date);
                    reminderDate.setHours(parseInt(hours));
                    reminderDate.setMinutes(parseInt(minutes));

                    let reminderOffset = 0;
                    switch(callData.call_reminder) {
                        case '5_min':
                            reminderOffset = 5;
                            break;
                        case '10_min':
                            reminderOffset = 10;
                            break;
                        case '15_min':
                            reminderOffset = 15;
                            break;
                        case '30_min':
                            reminderOffset = 30;
                            break;
                        case '1_hour':
                            reminderOffset = 60;
                            break;
                    }

                    reminderDate.setMinutes(reminderDate.getMinutes() - reminderOffset);

//                     await Notification.create({
//                         related_id: call.id,
//                         users: [assignedUser],
//                         title: "Call Reminder",
//                         notification_type: "reminder",
//                         from: req.user?.id,
//                         client_id: req.des?.client_id,
//                         date: reminderDate.toISOString().split('T')[0],
//                         time: reminderDate.toTimeString().split(' ')[0],
//                         message: `Reminder: Upcoming call - ${callData.subject}`,
//                         description: `📞 Call starts in ${reminderOffset} minutes:
// • Subject: ${callData.subject}
// • Date: ${callData.call_start_date}
// • Time: ${callData.call_start_time}
// • Purpose: ${callData.call_purpose || 'N/A'}
// • Status: ${callData.call_status}`,
//                         created_by: req.user?.username,
//                     });
                }
            }

            return responseHandler.success(res, "Call scheduled successfully!", call);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
};
