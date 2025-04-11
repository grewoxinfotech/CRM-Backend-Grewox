import FollowupMetting from "../../models/followupMettingModel.js";
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
            title: Joi.string().required(),
            meeting_type: Joi.string().valid('offline', 'online').required(),
            venue: Joi.string().optional().allow(null),
            location: Joi.string().optional().allow(null),
            meeting_link: Joi.string().optional().allow(null),
            from_date: Joi.string().required(),
            from_time: Joi.string().required(),
            to_date: Joi.string().required(), 
            to_time: Joi.string().required(),
            host: Joi.string().required(),
            assigned_to: Joi.object({
                assigned_to: Joi.array().items(Joi.string()).required()
            }).required(),
            reminder: Joi.object().allow(null),
            repeat: Joi.object().allow(null),
            participants_reminder: Joi.string().optional().allow(null)
        })
    }),

    handler: async (req, res) => {
        try {
            const { id } = req.params;
            const meetingData = req.body;

            // Create the meeting with all fields from model
                const meeting = await FollowupMetting.create({
                ...meetingData,
                client_id: req.des?.client_id,
                deal_id: id,
                created_by: req.user?.username
            });

            // Create notification for assigned users
//             for (const assignedUser of meetingData.assigned_to.assigned_to) {
//                 await Notification.create({
//                     related_id: meeting.id,
//                     users: [assignedUser],
//                     title: "New Meeting Assignment",
//                     from: req.user?.id,
//                     client_id: req.des?.client_id,
//                     message: `You have been assigned to a new meeting: ${meetingData.title}`,
//                     description: `📅 Meeting Details:
// • Title: ${meetingData.title}
// • Type: ${meetingData.meeting_type}
// • Venue: ${meetingData.venue}
// • Location: ${meetingData.location}
// • Date: ${meetingData.from_date}
// • Time: ${meetingData.from_time} - ${meetingData.to_time}
// • Host: ${meetingData.host}`,
//                     created_by: req.user?.username,
//                 });
//             }

            return responseHandler.success(res, "Meeting created successfully!", meeting);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
};
