import Lead from "../../models/leadModel.js";
import responseHandler from "../../utils/responseHandler.js";
import Joi from "joi";
import validator from "../../utils/validator.js";

export default {
    validator: validator({
        body: Joi.object({
            leadTitle: Joi.string().required(),
            leadStage: Joi.string().required(),
            currency: Joi.string().required(),
            leadValue: Joi.number().required(),
            source: Joi.string().required(),
            company_name: Joi.string().allow('', null),
            firstName: Joi.string().allow('', null),
            lastName: Joi.string().allow('', null),
            phoneCode: Joi.string().allow('', null),
            telephone: Joi.string().allow('', null),
            email: Joi.string().email().allow('', null),
            address: Joi.string().allow('', null),
            interest_level: Joi.string().required().valid('high', 'medium', 'low'),
            lead_members: Joi.object().allow(null),
            category: Joi.string().allow('', null),
            status: Joi.string().allow('', null),
        })
    }),

    handler: async (req, res) => {
        try {
            const { leadStage, leadTitle, firstName, lastName, phoneCode, telephone, email, address, interest_level, lead_members, category, status, source, company_name, currency, leadValue } = req.body;
            const existingLead = await Lead.findOne({ where: { email } });
            if (existingLead) {
                return responseHandler.conflict(res, "Lead with this email already exists!");
            }
            const lead = await Lead.create({
                leadStage, leadTitle, firstName, lastName, phoneCode, telephone, email, address, interest_level, lead_members, category, status, source, company_name, currency, leadValue,
                client_id: req.des?.client_id,
                created_by: req.user?.username
            });
            return responseHandler.success(res, "Lead created successfully!", lead);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
}


