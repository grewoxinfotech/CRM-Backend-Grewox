import Joi from "joi";
import Bill from "../../models/billModel.js";
import Setting from "../../models/settingModel.js";
import responseHandler from "../../utils/responseHandler.js";
import validator from "../../utils/validator.js";

export default {
  validator: validator({
    params: Joi.object({
      id: Joi.string().required(),
    }),
    body: Joi.object({
      vendor: Joi.string().required(),
      billNumber: Joi.string().required(),
      billDate: Joi.date().required(),
      discription: Joi.string().optional().allow("", null),
      status: Joi.string().optional(),
      discount: Joi.number().optional(),
      tax: Joi.number().optional(),
      currency: Joi.string().optional(),
      items: Joi.array().required(),
      total: Joi.number().required(),
      note: Joi.string().optional(),
      subTotal: Joi.number().required(),
    }),
  }),
  handler: async (req, res) => {
    try {
      const { id } = req.params;
      const {
        vendor,
        billNumber,
        billDate,
        discription,
        status,
        discount,
        tax,
        currency,
        items,
        total,
        note,
        subTotal,
      } = req.body;

      // Get settings for UPI details
      const settings = await Setting.findOne({
        where: { client_id: req.des?.client_id },
      });

      // Create UPI link using settings
      const upiLink = `upi://pay?pa=${settings?.merchant_upi_id || ""}&pn=${
        settings?.merchant_name || ""
      }&am=${total}&cu=INR`;

      // Create new bill
      const newBill = await Bill.create({
        related_id: id,
        vendor,
        billNumber,
        billDate,
        discription,
        status,
        discount,
        tax,
        currency,
        upiLink,
        items,
        amount: total,
        total,
        note,
        subTotal,
        bill_status: "draft",
        client_id: req.des?.client_id,
        created_by: req.user?.username,
      });

      return responseHandler.success(res, "Bill created successfully", newBill);
    } catch (error) {
      return responseHandler.error(res, error?.message);
    }
  },
};
