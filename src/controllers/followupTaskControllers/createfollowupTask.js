import FollowupTask from "../../models/followupTaskModel.js";
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
            due_date: Joi.string().required(),
            priority: Joi.string().valid('highest', 'high', 'medium', 'low').required(),
            task_reporter: Joi.string().optional().allow('', null),
            assigned_to: Joi.object({
                assigned_to: Joi.array().items(Joi.string()).required()
            }).required(),
            status: Joi.string().valid('not_started', 'in_progress', 'completed', 'on_hold', 'cancelled').required(),
            reminder: Joi.object().allow(null),
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
                repeat: repeat || null,
                client_id: req.des?.client_id,
                deal_id: id,
                created_by: req.user?.username
            });

            // Create notification for assigned user
//             await Notification.create({
//                 related_id: task.id,
//                 users: [taskData.assigned_to],
//                 title: "New Task Assignment", 
//                 from: req.user?.id,
//                 client_id: req.des?.client_id,
//                 message: `You have been assigned a new task: ${taskData.subject}`,
//                 description: `📋 Task Details:
// • Subject: ${taskData.subject}
// • Priority: ${taskData.priority}
// • Due Date: ${taskData.due_date}
// • Status: ${taskData.status}
// ${repeat?.repeat_type !== 'none' ? `• Repeats: ${getRepeatDescription(repeat)}` : ''}
// ${taskData.description ? `\nDescription: ${taskData.description}` : ''}`,
//                 created_by: req.user?.username,
//             });

            return responseHandler.success(res, "Task created successfully!", task);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
};

// Helper function to generate human-readable repeat description
function getRepeatDescription(repeat) {
    if (repeat.repeat_type === 'custom' && repeat.custom_repeat_frequency === 'monthly') {
        const pattern = repeat.custom_repeat_pattern;
        if (pattern?.type === 'day_position') {
            return `Every ${repeat.custom_repeat_interval} month(s) on the ${pattern.position} ${pattern.day}`;
        }
    }
    return `${repeat.repeat_type}`; // Basic description for other repeat types
}
