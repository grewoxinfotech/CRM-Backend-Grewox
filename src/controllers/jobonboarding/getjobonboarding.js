import responseHandler from "../../utils/responseHandler.js";
import JobOnboarding from "../../models/jobonboarding.js";
import Joi from "joi";
import validator from "../../utils/validator.js";
import User from "../../models/userModel.js";
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

            const jobOnboarding = await JobOnboarding.findAll({
                where: {
                    [Op.or]: [{ client_id: user.client_id }, { client_id: user.id }]
                }
            });

            return responseHandler.success(res, "Job onboarding fetched successfully", jobOnboarding);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
}
