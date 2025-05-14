import Joi from "joi";
import User from "../../models/userModel.js";
import responseHandler from "../../utils/responseHandler.js";
import validator from "../../utils/validator.js";
import Role from "../../models/roleModel.js";
import { Op } from "sequelize";

export default {
    validator: validator({
        query: Joi.object({
            page: Joi.number().optional().default(1),
            limit: Joi.number().optional().default(10),
            search: Joi.string().optional().allow(''),
            sort: Joi.string().optional(),
            order: Joi.string().valid('asc', 'desc').optional()
        })
    }),
    handler: async (req, res) => {
        try {
            const { page, limit, search, sort, order } = req.query;
            const ClientRoleID = await Role.findOne({
                where: {
                    role_name: "client"
                }
            });

            if (!ClientRoleID) {
                return responseHandler.error(res, "Client role not found");
            }

            const whereClause = {
                role_id: ClientRoleID.id
            };

            // Add search condition if search query exists
            if (search?.trim()) {
                whereClause[Op.or] = [
                    { username: { [Op.like]: `%${search}%` } },
                    { email: { [Op.like]: `%${search}%` } },
                    { firstName: { [Op.like]: `%${search}%` } },
                    { lastName: { [Op.like]: `%${search}%` } }
                ];
            }

            // If search is present, return all results without pagination
            if (search?.trim()) {
                const clients = await User.findAll({
                    where: whereClause,
                    order: sort ? [[sort, order || 'asc']] : undefined
                });

                return responseHandler.success(res, "Clients fetched successfully", clients);
            }

            // For regular requests with pagination
            const offset = (page - 1) * limit;

            // Get total count
            const totalCount = await User.count({
                where: whereClause
            });

            // Get paginated data with optional sorting
            const clients = await User.findAll({
                where: whereClause,
                offset: offset,
                limit: limit,
                order: sort ? [[sort, order || 'asc']] : undefined
            });

            return responseHandler.success(res, "Clients fetched successfully", {
                data: clients,
                currentPage: page,
                totalPages: Math.ceil(totalCount / limit),
                totalItems: totalCount,
                pageSize: limit
            });
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
}