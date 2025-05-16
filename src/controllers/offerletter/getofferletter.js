import Joi from "joi";
import validator from "../../utils/validator.js";
import responseHandler from "../../utils/responseHandler.js";
import OfferLetter from "../../models/offerletter.js";
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

            const offerLetter = await OfferLetter.findAll({
                where: {
                    [Op.or]: [{ client_id: user.client_id }, { client_id: user.id }]
                }
            });

            return responseHandler.success(res, "Offer letter fetched successfully", offerLetter);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
}