import Joi from "joi";
import Deal from "../../models/dealModel.js";
import responseHandler from "../../utils/responseHandler.js";
import validator from "../../utils/validator.js";

export default {
    validator: validator({
        body: Joi.object({
            firstName: Joi.string().required(),
            products: Joi.object({
                products: Joi.array().items(Joi.string()).optional()
            }).optional().allow("",null),
            email: Joi.string().required(),
            phone: Joi.string().required(),
            dealName: Joi.string().required(),
            pipeline: Joi.string().required(),
            status: Joi.string().required(),
            stage: Joi.string().required(),
            label: Joi.string().optional().allow("",null),
            value: Joi.number().required(),
            currency: Joi.string().required(),
            closedDate: Joi.date().optional().allow("",null),
            company_name: Joi.string().optional().allow("",null),
            source: Joi.string().optional().allow("",null),
        })
    }),
    handler: async (req, res) => {
        try {
            const { 
                firstName,
                products,
                email,
                phone,
                dealName,
                pipeline,
                stage,
                label,
                value,
                currency,
                closedDate,
                company_name,
                source
            } = req.body;

            const existingDeal = await Deal.findOne({ where: { dealName } });
            if (existingDeal) {
                return responseHandler.error(res, "Deal already exists");
            }

            const deal = await Deal.create({
                firstName,
                email,
                phone,
                dealName,
                pipeline,
                stage,
                products,
                label,
                value,
                currency,
                closedDate,
                company_name,
                source,
                client_id: req.des?.client_id,
                created_by: req.user?.username
            });

            return responseHandler.success(res, "Deal created successfully", deal);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
};
