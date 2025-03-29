import Joi from "joi";
import Payment from "../../models/paymentModel.js";
import validator from "../../utils/validator.js";
import responseHandler from "../../utils/responseHandler.js";

export default {
    validator: validator({
        params: Joi.object({
            id: Joi.string().required()
        }),
        body: Joi.object({
            project_name: Joi.string().optional().allow('', null),
            invoice: Joi.string().optional().allow('', null),   
            paidOn: Joi.date().optional().allow('', null),
            amount: Joi.string().optional().allow('', null),
            currency: Joi.string().optional().allow('', null),
            transactionId: Joi.string().optional().allow('', null),
            paymentMethod: Joi.string().optional().allow('', null),
            remark: Joi.string().optional().allow('', null)
        })
    }),
    handler: async (req, res) => {
        try {
           
            const { id } = req.params;
            const { project_name, invoice, paidOn, amount, currency, transactionId, paymentMethod, remark } = req.body;
            const existingPayment = await Payment.findOne({ where: { invoice,related_id: id} });
            if (existingPayment) {
                return responseHandler.error(res, "Payment already exists");
            }

            const payment = await Payment.create({
                related_id: id,
                project_name,
                invoice,
                paidOn,
                amount,
                currency,
                transactionId,
                paymentMethod,
                remark,
                client_id: req.des?.client_id,
                created_by: req.user?.username,
                updated_by: req.user?.username
            });

            return responseHandler.created(res, "Payment created successfully", payment);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
};
