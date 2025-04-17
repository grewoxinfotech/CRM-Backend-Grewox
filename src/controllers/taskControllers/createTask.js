import Joi from "joi";
import Task from "../../models/taskModel.js";
import responseHandler from "../../utils/responseHandler.js";
import validator from "../../utils/validator.js";
import Notification from "../../models/notificationModel.js";
import isSameDay from "../../utils/isSameDay.js"
import uploadToS3 from "../../utils/uploadToS3.js";

export default {
    validator: validator({
        params: Joi.object({
            id: Joi.string().required(),
        }),
        body: Joi.object({
            taskName: Joi.string().optional().allow('', null),
            startDate: Joi.date().optional().allow('', null),
            dueDate: Joi.date().optional().allow('', null),
            priority: Joi.string().optional().allow('', null),
            status: Joi.string().optional().allow('', null),
            assignTo: Joi.object().optional(),
            task_reporter: Joi.string().optional().allow('', null),
            reminder_date: Joi.date().optional().allow('', null),
            description: Joi.string().optional().allow('', null)
        })
    }),
    handler: async (req, res) => {
        try {
            const { id } = req.params;


            const {
                taskName,
                task_reporter,
                startDate,
                dueDate,
                assignTo,
                description,
                priority,
                status,
                reminder_date,
            } = req.body;
            const existingTask = await Task.findOne({ where: { taskName } });
            if (existingTask) {
                return responseHandler.error(res, "Task already exists");
            }
            let fileUrl = null;
            if (req.file) {
                fileUrl = await uploadToS3(req.file, "client", "task_files", req.user?.username);
            }

            const task = await Task.create({
                related_id: id,
                taskName,
                task_reporter,
                startDate,
                dueDate,
                assignTo,
                description,
                priority,
                status,
                reminder_date,
                file: fileUrl,
                client_id: req.des?.client_id,
                created_by: req.user?.username,
            });

            const taskId = task.id;

            if (reminder_date) {
                const reminderDate = new Date(reminder_date);
                const today = new Date();

                if (isSameDay(reminderDate, today)) {
                    const dueDateDiff = Math.ceil(
                        (new Date(dueDate) - reminderDate) / (1000 * 60 * 60 * 24)
                    );
                    await Notification.create({
                        related_id: taskId,
                        users: assignTo,
                        title: "Task Reminder",
                        notification_type: "reminder",
                        from: req.user?.id,
                        client_id: req.des?.client_id,
                        message: `Task due: ${dueDateDiff} days. Don't forget: ${taskName}`,
                        description: `Task Name: ${taskName}, start date: ${startDate}, due date: ${dueDate}`,
                        created_by: req.user?.username,
                    });
                }
            }

            await Notification.create({
                related_id: taskId,
                users: assignTo,
                title: "New Task",
                from: req.user?.id,
                client_id: req.des?.client_id,
                message: `${req.user?.username} assigned you a task: ${taskName}`,
                description: `Task Name: ${taskName}, start date: ${startDate}, due date: ${dueDate}`,
                created_by: req.user?.username,
            });

            return responseHandler.success(res, "Task created successfully", task);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    },
};

