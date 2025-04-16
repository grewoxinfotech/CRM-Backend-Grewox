import FollowupTask from "../../models/followupTaskModel.js";
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
            subject: Joi.string().required(),
            due_date: Joi.string().required(),
            priority: Joi.string().valid('highest', 'high', 'medium', 'low').required(),
            task_reporter: Joi.string().optional().allow('', null),
            assigned_to: Joi.object({
                assigned_to: Joi.array().items(Joi.string()).required()
            }).required(),
            status: Joi.string().valid('not_started', 'in_progress', 'completed', 'on_hold', 'cancelled').required(),
            reminder: Joi.object({
                reminder_date: Joi.string().required(),
                reminder_time: Joi.string().required()
            }).allow(null),
            repeat: Joi.object().allow(null),
            description: Joi.string().allow('', null),
        })
    }),

    handler: async (req, res) => {
        try {
            const { id } = req.params;
            const { repeat, reminder, ...taskData } = req.body;

            // Create the task with all fields from model
            const task = await FollowupTask.create({
                ...taskData,
                reminder: reminder || null,
                task_reporter: req.user?.id,
                repeat: repeat || null,
                client_id: req.des?.client_id,
                related_id: id,
                created_by: req.user?.username
            });

            // Create notification for assigned users
            for (const assignedUser of taskData.assigned_to.assigned_to) {
                // 1. Create task assignment notification
                await Notification.create({
                    related_id: task.id,
                    users: [assignedUser],
                    title: "New Task Assignment",
                    from: req.user?.id,
                    client_id: req.des?.client_id,
                    message: `You have been assigned a new task: ${taskData.subject}`,
                    description: `📋 Task Details:
• Subject: ${taskData.subject}
• Priority: ${taskData.priority}
• Due Date: ${taskData.due_date}
• Status: ${taskData.status}
${taskData.description ? `\nDescription: ${taskData.description}` : ''}`,
                    created_by: req.user?.username,
                });

                // 2. Create reminder notification for the due date
                await Notification.create({
                    related_id: task.id,
                    users: [assignedUser],
                    title: "Task Due Reminder", 
                    notification_type: "reminder",
                    from: req.user?.id,
                    client_id: req.des?.client_id,
                    date: reminder?.reminder_date || taskData.due_date,
                    time: reminder?.reminder_time || "09:00:00", // Default to 9 AM if no reminder time
                    message: `Task due today: ${taskData.subject}`,
                    description: `⚠️ Task Due Reminder:
• Subject: ${taskData.subject}
• Due Date: ${taskData.due_date}
• Priority: ${taskData.priority}
• Status: ${taskData.status}
${taskData.description ? `\nDescription: ${taskData.description}` : ''}`,
                    created_by: req.user?.username,
                });
            }

            return responseHandler.success(res, "Task created successfully!", task);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
};

// Helper function to generate human-readable repeat description
function getRepeatDescription(repeat) {
    // if (repeat.repeat_type === 'custom' && repeat.custom_repeat_frequency === 'monthly') {
    //     const pattern = repeat.custom_repeat_pattern;
    //     if (pattern?.type === 'day_position') {
    //         return `Every ${repeat.custom_repeat_interval} month(s) on the ${pattern.position} ${pattern.day}`;
    //     }
    // }
    // return `${repeat.repeat_type}`; // Basic description for other repeat types
}

// Add this helper function
function getWeekDays(days) {
    const weekDays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    return days.map(day => weekDays[day]).join(' and ');
}
