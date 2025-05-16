import Joi from "joi";
import Training from "../../models/trainingModel.js";
import validator from "../../utils/validator.js";
import responseHandler from "../../utils/responseHandler.js";
import Role from "../../models/roleModel.js";
import User from "../../models/userModel.js";
import { Op } from "sequelize";

export default {
    validator: validator({
        query: Joi.object({
            page: Joi.number().optional(),
            limit: Joi.number().optional(),
        })
    }),
    handler: async (req, res) => {
        try {
            const userRole = req.user.role;
            let training;

            // Find role in role model
            const role = await Role.findOne({
                where: { id: userRole }
            });

            if (!role) {
                return responseHandler.error(res, "Role not found");
            }

            const user = await User.findOne({
                where: { id: req.user.id }
            });

            training = await Training.findAll({
                where: {
                    [Op.or]: [
                        { client_id: user.client_id },
                        { client_id: user.id }
                    ]
                }
            });

            return responseHandler.success(res, "Training fetched successfully", training);

        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
}
