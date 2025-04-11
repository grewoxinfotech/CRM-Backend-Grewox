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
            const { subject, due_date, priority, task_reporter, assigned_to, status, reminder, repeat, description } = req.body;

            const followupTask = await FollowupTask.findByPk(id);
            if (!followupTask) {
                return responseHandler.error(res, "Followup task not found");
            }

            await FollowupTask.update({
                subject,
                due_date,
                priority,
                task_reporter,
                assigned_to,
                status,
                reminder,
                repeat,
                description,
                deal_id: followupTask.deal_id,
                updated_by: req.user.username
            }, {
                where: { id }
            });

            // Fetch the updated task
            const updatedTask = await FollowupTask.findByPk(id);

            return responseHandler.success(res, "Followup task updated successfully", updatedTask);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
}
