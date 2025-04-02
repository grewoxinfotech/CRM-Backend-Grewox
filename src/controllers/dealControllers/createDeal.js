import Joi from "joi";
import Deal from "../../models/dealModel.js";
import responseHandler from "../../utils/responseHandler.js";
import validator from "../../utils/validator.js";

export default {
    validator: validator({
        body: Joi.object({
            dealTitle: Joi.string().required(),
            currency: Joi.string().required(),
            value: Joi.number().required(),
            pipeline: Joi.string().required(),
            stage: Joi.string().required(),
            source: Joi.string().required(),
            closedDate: Joi.date().required(),
            products: Joi.object({
                products: Joi.array().items(Joi.string()).optional()
            }).optional().allow("", null),
            firstName: Joi.string().optional().allow("", null),
            lastName: Joi.string().optional().allow("", null),
            email: Joi.string().optional().allow("", null),
            phone: Joi.string().optional().allow("", null),
            company_name: Joi.string().optional().allow("", null),
            address: Joi.string().optional().allow("", null),
        })
    }),
    handler: async (req, res) => {
        try {
            const {
                dealTitle,
                currency,
                value,
                pipeline,
                stage,
                source,
                closedDate,
                products,
                firstName,
                lastName,
                email,
                phone,
                company_name,
                address,
            } = req.body;

            const existingDeal = await Deal.findOne({ where: { dealTitle } });
            if (existingDeal) {
                return responseHandler.error(res, "Deal already exists");
            }

            const deal = await Deal.create({
                dealTitle,
                currency,
                value,
                pipeline,
                stage,
                source,
                closedDate,
                products,
                firstName,
                lastName,
                email,
                phone,
                company_name,
                address,
                client_id: req.des?.client_id,
                created_by: req.user?.username
            });

            return responseHandler.success(res, "Deal created successfully", deal);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
};
