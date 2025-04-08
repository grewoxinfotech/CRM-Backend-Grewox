import Lead from "../../models/leadModel.js";
import responseHandler from "../../utils/responseHandler.js";
import Joi from "joi";
import validator from "../../utils/validator.js";
import Notification from "../../models/notificationModel.js";

export default {
    validator: validator({
        body: Joi.object({
            leadTitle: Joi.string().required(),
            leadStage: Joi.string().required(),
            pipeline: Joi.string().required(),
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
            const { leadStage, leadTitle, firstName, lastName, phoneCode, telephone, email, address, interest_level, lead_members, category, source, company_name, currency, leadValue, pipeline, status } = req.body;
            
            const existingLead = await Lead.findOne({ where: { email } });
            if (existingLead) {
                return responseHandler.conflict(res, "Lead with this email already exists!");
            }

            const lead = await Lead.create({
                leadStage, leadTitle, firstName, lastName, phoneCode, telephone, email, address, interest_level, lead_members, category, status, source, company_name, currency, leadValue, pipeline, status,
                client_id: req.des?.client_id,
                created_by: req.user?.username
            });

            // Create notifications
            if (lead_members && Object.keys(lead_members).length > 0) {
                // Notification for lead members
                await Notification.create({
                    related_id: req.user?.id,
                    users: Object.keys(lead_members),
                    title: "Lead Assignment",
                    from: req.user?.id,
                    client_id: req.des?.client_id,
                    message: `You have been assigned to a new lead "${leadTitle}"`,
                    description: `🎯 Lead Details:\n• Company: ${company_name || 'N/A'}\n• Value: ${currency} ${leadValue}\n• Stage: ${leadStage}\n• Interest: ${interest_level}\n\nThis lead has been assigned to you for follow-up.`,
                    created_by: req.user?.username,
                });
            }

            // General notification for other team members
            await Notification.create({
                related_id: req.user?.id,
                users: [], // For other team members if needed
                title: "New Lead Created",
                from: req.user?.id,
                client_id: req.des?.client_id,
                message: `A new high-value lead "${leadTitle}" has been created`,
                description: `💼 Lead Overview:\n• Company: ${company_name || 'N/A'}\n• Value: ${currency} ${leadValue}\n• Stage: ${leadStage}\n• Interest Level: ${interest_level}\n• Source: ${source}`,
                created_by: req.user?.username,
            });

            return responseHandler.success(res, "Lead created successfully!", lead);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
}


