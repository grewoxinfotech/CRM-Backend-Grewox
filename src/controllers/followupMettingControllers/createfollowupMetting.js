import FollowupMetting from "../../models/followupMettingModel.js";
import responseHandler from "../../utils/responseHandler.js";
import Joi from "joi";
import validator from "../../utils/validator.js";
import Notification from "../../models/notificationModel.js";
import dayjs from "dayjs";

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
            meeting_status: Joi.string().required(),
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


            // Create the meeting
            const meeting = await FollowupMetting.create({
                ...meetingData,
                client_id: req.des?.client_id,
                host: req.user?.id,
                related_id: id,
                created_by: req.user?.username
            });

            // Generate meeting dates based on repeat configuration
            const meetingDates = [];
            if (meetingData.repeat && meetingData.repeat.repeat_type !== 'none') {
                const startDate = dayjs(meetingData.repeat.repeat_start_date);
                const repeatTimes = parseInt(meetingData.repeat.repeat_times) || 1;

                for (let i = 0; i < repeatTimes; i++) {
                    let nextDate;
                    switch (meetingData.repeat.repeat_type) {
                        case 'daily':
                            nextDate = startDate.add(i, 'day');
                            break;
                        case 'weekly':
                            nextDate = startDate.add(i, 'week');
                            break;
                        case 'monthly':
                            nextDate = startDate.add(i, 'month');
                            break;
                        case 'yearly':
                            nextDate = startDate.add(i, 'year');
                            break;
                        default:
                            nextDate = startDate;
                    }
                    meetingDates.push(nextDate);
                }
            } else {
                // If no repeat, just use the original meeting date
                meetingDates.push(dayjs(meetingData.from_date));
            }

            // Create notifications for each assigned user and each meeting date
            for (const assignedUser of meetingData.assigned_to.assigned_to) {
                // Create assignment notification
                await Notification.create({
                    related_id: meeting.id,
                    users: [assignedUser],
                    title: "New Meeting Assignment",
                    from: req.user?.id,
                    client_id: req.des?.client_id,
                    message: `You have been assigned to a new meeting: ${meetingData.title}`,
                    description: `📅 Meeting Details:
• Title: ${meetingData.title}
• Type: ${meetingData.meeting_type}
${meetingData.venue ? `• Venue: ${meetingData.venue}` : ''}
${meetingData.location ? `• Location: ${meetingData.location}` : ''}
${meetingData.meeting_link ? `• Meeting Link: ${meetingData.meeting_link}` : ''}
• Date: ${meetingData.from_date}
• Time: ${meetingData.from_time} - ${meetingData.to_time}
${meetingData.repeat ? `• Repeats: ${getRepeatDescription(meetingData.repeat)}` : ''}`,
                    created_by: req.user?.username,
                });

                // Create reminder notifications for each meeting date
                if (meetingData.reminder && meetingData.reminder.reminder_date) {
                    for (const meetingDate of meetingDates) {
                        const reminderDateTime = dayjs(`${meetingData.reminder.reminder_date} ${meetingData.reminder.reminder_time}`);
                        
                        await Notification.create({
                            related_id: meeting.id,
                            users: [assignedUser],
                            title: "Meeting Reminder",
                            notification_type: "reminder",
                            from: req.user?.id,
                            client_id: req.des?.client_id,
                            date: reminderDateTime.format('YYYY-MM-DD'),
                            time: reminderDateTime.format('HH:mm:ss'),
                            message: `Reminder: Upcoming meeting - ${meetingData.title}`,
                            description: `⏰ Meeting starts soon:
• Title: ${meetingData.title}
• Type: ${meetingData.meeting_type}
${meetingData.venue ? `• Venue: ${meetingData.venue}` : ''}
${meetingData.location ? `• Location: ${meetingData.location}` : ''}
${meetingData.meeting_link ? `• Meeting Link: ${meetingData.meeting_link}` : ''}
• Date: ${meetingDate.format('YYYY-MM-DD')}
• Time: ${meetingData.from_time} - ${meetingData.to_time}`,
                            created_by: req.user?.username,
                        });
                    }
                }
            }

            return responseHandler.success(res, "Meeting created successfully!", meeting);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
};

// Helper function to generate human-readable repeat description
function getRepeatDescription(repeat) {
    if (!repeat) return '';
    
    let description = `Every ${repeat.repeat_type}`;
    if (repeat.repeat_times) {
        description += `, ${repeat.repeat_times} times`;
    }
    if (repeat.repeat_end_date) {
        description += `, until ${repeat.repeat_end_date}`;
    }
    return description;
}
