import Joi from "joi";
import User from "../../models/userModel.js";
import responseHandler from "../../utils/responseHandler.js";
import validator from "../../utils/validator.js";
import { Op } from "sequelize";

export default {
    validator: validator({
        query: Joi.object({
            page: Joi.number().optional(),
            limit: Joi.number().optional()
        })
    }),
    handler: async (req, res) => {
        try {
            const user = await User.findOne({
                where: { id: req.user.id }
            });

            const employees = await User.findAll({
                where: {
                    [Op.or]: [{ client_id: user.client_id }, { client_id: user.id }],
                    employeeId: {
                        [Op.not]: null
                    }
                }
            });

            return responseHandler.success(res, "Employees fetched successfully", employees);
        } catch (error) {
            return responseHandler.error(res, error, 'Error fetching employees');
        }
    }
};
