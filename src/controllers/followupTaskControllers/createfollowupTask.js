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
                task_reporter: req.user?.id,
                repeat: repeat || null,
                client_id: req.des?.client_id,
                related_id: id,
                created_by: req.user?.username
            });

            // Create notification for assigned users
            for (const assignedUser of taskData.assigned_to.assigned_to) {
                // Create task assignment notification
//                 await Notification.create({
//                     related_id: task.id,
//                     users: [assignedUser],
//                     title: "New Task Assignment",
//                     from: req.user?.id,
//                     client_id: req.des?.client_id,
//                     message: `You have been assigned a new task: ${taskData.subject}`,
//                     description: `📋 Task Details:
// • Subject: ${taskData.subject}
// • Priority: ${taskData.priority}
// • Due Date: ${taskData.due_date}
// • Status: ${taskData.status}
// ${repeat?.repeat_type !== 'none' ? `• Repeats: ${getRepeatDescription(repeat)}` : ''}
// ${taskData.description ? `\nDescription: ${taskData.description}` : ''}`,
//                     created_by: req.user?.username,
//                 });

                // Create reminder notifications based on repeat pattern
                if (repeat?.repeat_start_date && repeat?.repeat_start_time) {
                    const reminderDates = [];
                    const startDate = dayjs(repeat.repeat_start_date);
                    let endDate;
                    
                    // Calculate end date based on repeat_end_type and repeat_times
                    if (repeat.repeat_end_type === 'after' && repeat.repeat_times) {
                        const repeatTimes = parseInt(repeat.repeat_times);
                        if (repeat.repeat_type === 'custom' && repeat.custom_repeat_frequency === 'weekly') {
                            // For weekly repeats, we need to consider the number of days selected
                            const weeksNeeded = Math.ceil(repeatTimes / repeat.custom_repeat_days.length);
                            endDate = startDate.add(weeksNeeded * parseInt(repeat.custom_repeat_interval), 'week');
                        } else {
                            endDate = startDate.add(repeatTimes, repeat.custom_repeat_frequency);
                        }
                    } else if (repeat.repeat_end_date) {
                        endDate = dayjs(repeat.repeat_end_date);
                    } else {
                        endDate = dayjs(taskData.due_date).add(3, 'month');
                    }

                    // Generate dates based on repeat type
                    if (repeat.repeat_type === 'custom' && repeat.custom_repeat_frequency === 'weekly') {
                        let currentDate = startDate;
                        let totalReminders = 0;
                        
                        while (currentDate.isBefore(endDate) && (!repeat.repeat_times || totalReminders < parseInt(repeat.repeat_times))) {
                            // Check if current week's days should be included
                            for (const dayNumber of repeat.custom_repeat_days) {
                                const nextDate = currentDate.day(dayNumber);
                                
                                // Only include if the date is not before the start date
                                if (!nextDate.isBefore(startDate) && nextDate.isBefore(endDate)) {
                                    reminderDates.push({
                                        date: nextDate.format('YYYY-MM-DD'),
                                        time: repeat.repeat_start_time
                                    });
                                    totalReminders++;
                                    
                                    // Break if we've reached the desired number of reminders
                                    if (repeat.repeat_times && totalReminders >= parseInt(repeat.repeat_times)) {
                                        break;
                                    }
                                }
                            }
                            
                            // Move to next interval week
                            currentDate = currentDate.add(parseInt(repeat.custom_repeat_interval), 'week');
                        }
                    }

                    // Create notifications for each reminder date
                    for (const reminder of reminderDates) {
                        await Notification.create({
                            related_id: task.id,
                            users: [assignedUser],
                            title: "Task Reminder",
                            notification_type: "reminder",
                            from: req.user?.id,
                            client_id: req.des?.client_id,
                            date: reminder.date,
                            time: reminder.time,
                            message: `Reminder: Task due soon - ${taskData.subject}`,
                            description: `⏰ Task Reminder:
• Subject: ${taskData.subject}
• Due Date: ${reminder.date}
• Time: ${reminder.time}
• Priority: ${taskData.priority}
• Status: ${taskData.status}
• Repeat: Every ${repeat.custom_repeat_interval} week(s) on ${getWeekDays(repeat.custom_repeat_days)}
${taskData.description ? `\nDescription: ${taskData.description}` : ''}`,
                            created_by: req.user?.username,
                        });
                    }
                }
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
