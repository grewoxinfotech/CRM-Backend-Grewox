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
            subject: Joi.string().optional(),
            due_date: Joi.string().optional(),
            priority: Joi.string().valid('highest', 'high', 'medium', 'low').optional(),
            task_reporter: Joi.string().optional().allow('', null),
            assigned_to: Joi.object({
                assigned_to: Joi.array().items(Joi.string()).optional()
            }).optional(),
            status: Joi.string().valid('not_started', 'in_progress', 'completed', 'on_hold', 'cancelled').optional(),
            reminder: Joi.object().allow(null),
            repeat: Joi.object().allow(null),
            description: Joi.string().allow('', null),
        })
    }),

    handler: async (req, res) => {
        try {
            const { id } = req.params;
            const { repeat, reminder, ...updateData } = req.body;

            // Find the existing task
            const existingTask = await FollowupTask.findById(id);
            if (!existingTask) {
                return responseHandler.error(res, "Task not found", 404);
            }

            // Update the task
            const updatedTask = await FollowupTask.findByIdAndUpdate(
                id,
                {
                    ...updateData,
                    reminder: reminder || existingTask.reminder,
                    repeat: repeat || existingTask.repeat,
                    updated_by: req.user?.username,
                    updated_at: new Date()
                },
                { new: true }
            );

            // Create notification for assigned user if assignment changed
            if (updateData.assigned_to && updateData.assigned_to.assigned_to?.length > 0) {
                await Notification.create({
                    related_id: updatedTask.id,
                    users: updateData.assigned_to.assigned_to,
                    title: "Task Update",
                    from: req.user?.id,
                    client_id: req.des?.client_id,
                    message: `A task has been updated and assigned to you: ${updatedTask.subject}`,
                    description: `📋 Updated Task Details:
• Subject: ${updatedTask.subject}
• Priority: ${updatedTask.priority}
• Due Date: ${updatedTask.due_date}
• Status: ${updatedTask.status}
${updatedTask.repeat?.repeat_type !== 'none' ? `• Repeats: ${getRepeatDescription(updatedTask.repeat)}` : ''}
${updatedTask.description ? `\nDescription: ${updatedTask.description}` : ''}`,
                    created_by: req.user?.username,
                });
            }

            return responseHandler.success(res, "Task updated successfully!", updatedTask);
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