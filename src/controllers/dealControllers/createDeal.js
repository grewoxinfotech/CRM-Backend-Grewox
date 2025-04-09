import Joi from "joi";
import Deal from "../../models/dealModel.js";
import CompanyAccount from "../../models/companyAccountModel.js";
import Contact from "../../models/contactModel.js";
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


            // First check if company exists
            let companyAccount = await CompanyAccount.findOne({
                where: {
                    company_name,
                    client_id: req.des?.client_id
                }
            });

            // If company doesn't exist, create new company account
            if (!companyAccount && company_name) {

                companyAccount = await CompanyAccount.create({
                    account_owner: req.user?.id,
                    company_name,
                    phone_number: phone,
                    billing_address: address,
                    client_id: req.des?.client_id,
                    created_by: req.user?.username
                });

            }

            // Create contact if firstName exists
            let contact = null;
            if (firstName) {
                // Check if contact already exists
                contact = await Contact.findOne({
                    where: {
                        first_name: firstName,
                        company_name,
                        client_id: req.des?.client_id
                    }
                });

                // If contact doesn't exist, create new contact
                if (!contact) {

                    contact = await Contact.create({
                        contact_owner: companyAccount?.account_owner || req.user?.id,
                        first_name: firstName,
                        last_name: lastName || "",
                        company_name:companyAccount.id,
                        email,
                        phone,
                        address,
                        client_id: req.des?.client_id,
                        created_by: req.user?.username
                    });

                }
            }

            const existingDeal = await Deal.findOne({ where: { dealTitle } });
            if (existingDeal) {
                return responseHandler.error(res, "Deal already exists");
            }

            // Create deal with company and contact references
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
                company_id: companyAccount?.id,
                contact_id: contact?.id,
                client_id: req.des?.client_id,
                created_by: req.user?.username
            });

            return responseHandler.success(res, "Deal created successfully", deal );
        } catch (error) {
            console.error("Error creating deal:", error);
            return responseHandler.error(res, error?.message);
        }
    }
};
