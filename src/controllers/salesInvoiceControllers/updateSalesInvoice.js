import Joi from "joi";
import SalesInvoice from "../../models/salesInvoiceModel.js";
import validator from "../../utils/validator.js";
import responseHandler from "../../utils/responseHandler.js";

export default {
    validator: validator({
        params: Joi.object({
            id: Joi.string().required()
        }),
        body: Joi.object({
            customer: Joi.string().required(),
            issueDate: Joi.date().required(),
            dueDate: Joi.date().required(),
            currency: Joi.string().required(),
            category: Joi.string().optional().allow("", null),
            items: Joi.object().required(),
            discount: Joi.number().optional(),
            tax: Joi.number().optional(),
            total: Joi.number().optional(),
            subTotal: Joi.number().optional(),
            status: Joi.string().optional()
        })
    }),
    handler: async (req, res) => {
        try {
            const { id } = req.params;
            const { customer, issueDate, dueDate, category, items, discount, currency, tax, total, subTotal, status } = req.body;
            const salesInvoice = await SalesInvoice.findByPk(id);
            if (!salesInvoice) {
                return responseHandler.error(res, "SalesInvoice not found");
            }
            await salesInvoice.update({ customer, issueDate, dueDate, category, items, discount, currency, tax, total, subTotal, status, updated_by: req.user?.username });
            return responseHandler.success(res, "SalesInvoice updated successfully", salesInvoice);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
};
