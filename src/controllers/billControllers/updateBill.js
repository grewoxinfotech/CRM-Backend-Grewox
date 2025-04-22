import Joi from "joi";
import Bill from "../../models/billModel.js";
import Setting from "../../models/settingModel.js";
import responseHandler from "../../utils/responseHandler.js";
import validator from "../../utils/validator.js";

export default {
    validator: validator({
        params: Joi.object({
            id: Joi.string().required()
        }),
        body: Joi.object({
            vendor: Joi.string().optional(),
            billDate: Joi.date().optional(),
            discription: Joi.string().optional(),
            status: Joi.string().optional(),
            discount: Joi.number().optional(),
            tax: Joi.number().optional(),
            total: Joi.number().optional(),
            subTotal: Joi.number().optional(),
            currency: Joi.string().optional(),
            items: Joi.array().optional(),
        })
    }),
    handler: async (req, res) => { 
        try {
            const { id } = req.params;
            const { vendor, billDate, discription, status, discount, tax, total, subTotal, currency, items } = req.body;

            const newBill = await Bill.findByPk(id);
            if (!newBill) {
                return responseHandler.error(res, "Bill not found");
            }

            // Get settings for UPI details
            const settings = await Setting.findOne({
                where: { client_id: req.des?.client_id }
            });

            // Create UPI link using settings
            const upiLink = `upi://pay?pa=${settings?.merchant_upi_id || ''}&pn=${settings?.merchant_name || ''}&am=${total || newBill.total}&cu=INR`;

            await newBill.update({ 
                vendor, 
                billDate, 
                discription, 
                status, 
                discount, 
                tax, 
                total, 
                subTotal, 
                currency, 
                items,
                upiLink,
                updated_by: req.user?.username 
            });
            
            return responseHandler.success(res, "Bill updated successfully", newBill);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
}
