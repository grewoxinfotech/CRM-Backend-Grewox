import Joi from "joi";
import validator from "../../utils/validator.js";
import Meeting from "../../models/meetingModel.js";
import responseHandler from "../../utils/responseHandler.js";
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

            const meetings = await Meeting.findAll({
                where: {
                    [Op.or]: [{ client_id: user.client_id }, { client_id: user.id }]
                }
            });

            return responseHandler.success(res, "Meetings fetched successfully", meetings);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
}