import Joi from "joi";
import validator from "../../utils/validator.js";
import Notification from "../../models/notificationModel.js";
import responseHandler from "../../utils/responseHandler.js";
import User from "../../models/userModel.js";
import Role from "../../models/roleModel.js";
import { Op } from "sequelize";

export default {
    validator: validator({
        params: Joi.object({
            id: Joi.string().required()
        }),
        query: Joi.object({
            page: Joi.number().optional(),
            limit: Joi.number().optional()
        })
    }),
    handler: async (req, res) => {
        try {
            const userRole = req.user.role;
            let notification;
            const currentDate = new Date();
            const currentTime = currentDate.toLocaleTimeString('en-US', { hour12: false });
            const formattedCurrentDate = currentDate.toISOString().split('T')[0];

            // Find role in role model
            const role = await Role.findOne({
                where: { id: userRole }
            });

            if (!role) {
                return responseHandler.error(res, "Role not found");
            }

            const whereClause = {
                [Op.or]: [
                    // For normal notifications (no date/time filtering)
                    { notification_type: 'normal' },
                    // For reminders, check date and time
                    {
                        [Op.and]: [
                            { notification_type: 'reminder' },
                            { date: formattedCurrentDate },
                            { time: currentTime }
                        ]
                    }
                ],
                read: false
            };

            if (role.role_name === 'client') {
                whereClause.client_id = req.user.id;
                notification = await Notification.findAll({
                    where: whereClause,
                    order: [['createdAt', 'DESC']]
                });
            } else {
                const user = await User.findOne({
                    where: { id: req.user.id }
                });

                if (!user) {
                    return responseHandler.error(res, "User not found");
                }

                whereClause.client_id = user.client_id;
                notification = await Notification.findAll({
                    where: whereClause,
                    order: [['createdAt', 'DESC']]
                });
            }

            return responseHandler.success(res, "Notifications fetched successfully", notification);

        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    },
};