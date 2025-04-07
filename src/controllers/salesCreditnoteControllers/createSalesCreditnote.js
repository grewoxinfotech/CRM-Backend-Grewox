import Joi from "joi";
import SalesCreditnote from "../../models/salesCreditnoteModel.js";
import SalesInvoice from "../../models/salesInvoiceModel.js";
import validator from "../../utils/validator.js";
import responseHandler from "../../utils/responseHandler.js";
import uploadToS3 from "../../utils/uploadToS3.js";

export default {
  validator: validator({
    body: Joi.object({
      invoice: Joi.string().required(),
      date: Joi.date().optional(),
      currency: Joi.string().optional(),
      amount: Joi.number().required(),
      description: Joi.string().optional().allow("", null),
    }),
  }),
  handler: async (req, res) => {
    try {
      const { id } = req.user;
      const { invoice, date, currency, amount, description } = req.body;

      // Find the related sales invoice
      const salesInvoice = await SalesInvoice.findByPk(invoice);
      if (!salesInvoice) {
        return responseHandler.error(res, "Sales Invoice not found");
      }

      // Get existing credit notes total for this invoice
      const existingCreditNotes = await SalesCreditnote.findAll({
        where: { invoice }
      });
      const totalCreditedAmount = existingCreditNotes.reduce((sum, note) => sum + note.amount, 0);

      // Check if credit amount is valid (including existing credit notes)
      const remainingInvoiceAmount = salesInvoice.total - totalCreditedAmount;
      if (amount > remainingInvoiceAmount) {
        return responseHandler.error(
          res,
          `Credit amount cannot be greater than remaining invoice amount (${remainingInvoiceAmount})`
        );
      }

      // Handle file upload to S3
      let attachmentUrl = null;
      if (req.file) {
        attachmentUrl = await uploadToS3(
          req.file,
          req.user?.roleName,
          "creditnotes",
          req.user?.username
        );
      }

      // Create credit note
      const salesCreditnote = await SalesCreditnote.create({
        related_id: id,
        invoice,
        date,
        currency,
        amount,
        description,
        attachment: attachmentUrl,
        client_id: req.des?.client_id,
        created_by: req.user?.username,
      });

      // Update invoice amount
      const newTotal = salesInvoice.amount - amount;
      await salesInvoice.update({ 
        amount: newTotal  // Update amount field as well
      });

      return responseHandler.success(
        res,
        "Sales Credit Note created successfully",
        {
          creditNote: salesCreditnote,
          updatedInvoice: {
            id: salesInvoice.id,
            previousTotal: salesInvoice.total,
            newTotal: newTotal,
            creditedAmount: amount
          }
        }
      );
    } catch (error) {
      return responseHandler.error(res, error?.message);
    }
  },
};
