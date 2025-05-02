import Joi from "joi";
import { Op } from "sequelize";
import SalesCreditnotes from "../../models/salesCreditnoteModel.js";
import SalesInvoice from "../../models/salesInvoiceModel.js";
import SalesRevenue from "../../models/salesRevenueModel.js";
import Activity from "../../models/activityModel.js";
import validator from "../../utils/validator.js";
import responseHandler from "../../utils/responseHandler.js";

export default {
  validator: validator({
    params: Joi.object({
      id: Joi.string().required(),
    }),
  }),
  handler: async (req, res) => {
    try {
      const { id } = req.params;

      // Find the credit note
      const salesCreditnote = await SalesCreditnotes.findByPk(id);
      if (!salesCreditnote) {
        return responseHandler.error(res, "Credit note not found");
      }

      // Find the related invoice
      const invoice = await SalesInvoice.findByPk(salesCreditnote.invoice);
      if (!invoice) {
        return responseHandler.error(res, "Related invoice not found");
      }

      // Store values for activity log
      const previousAmount = invoice.amount;
      const creditNoteAmount = salesCreditnote.amount;
      const newAmount = Number(invoice.amount) + Number(creditNoteAmount);

      // Get all remaining credit notes for this invoice (excluding the one being deleted)
      const remainingCreditNotes = await SalesCreditnotes.findAll({
        where: {
          invoice: salesCreditnote.invoice,
          id: { [Op.ne]: id },
        },
      });

      // Calculate total credited amount from remaining credit notes
      const totalRemainingCredited = remainingCreditNotes.reduce(
        (sum, note) => sum + Number(note.amount),
        0
      );

      // Determine new payment status
      let newPaymentStatus;
      if (totalRemainingCredited === 0) {
        newPaymentStatus = "unpaid";
      } else if (totalRemainingCredited < invoice.total) {
        newPaymentStatus = "partially_paid";
      } else {
        newPaymentStatus = "paid";
      }

      // Find existing revenue entry for this invoice
      const existingRevenue = await SalesRevenue.findOne({
        where: {
          salesInvoiceNumber: invoice.id,
        },
      });

      // If revenue exists and payment status is changing from paid to unpaid/partially_paid
      if (
        existingRevenue &&
        invoice.payment_status === "paid" &&
        newPaymentStatus !== "paid"
      ) {
        // Delete the existing revenue entry as the invoice is no longer fully paid
        await existingRevenue.destroy();

        // Log revenue deletion
        await Activity.create({
          related_id: req.user?.id,
          activity_from: "sales_revenue",
          activity_id: existingRevenue.id,
          action: "deleted",
          performed_by: req.user?.username,
          client_id: req.des?.client_id,
          activity_message: `Revenue entry deleted due to credit note deletion for invoice #${invoice.id}`,
        });
      }

      // Update the invoice
      await invoice.update({
        amount: newAmount,
        payment_status: newPaymentStatus,
      });

      // Delete the credit note
      await salesCreditnote.destroy();

      // Log activity
      await Activity.create({
        related_id: req.user?.id,
        activity_from: "sales_creditnote",
        activity_id: id,
        action: "deleted",
        performed_by: req.user?.username,
        client_id: req.des?.client_id,
        activity_message: `Credit note of ${creditNoteAmount} ${
          invoice.currency
        } deleted for invoice #${
          invoice.id
        }. Invoice amount restored from ${previousAmount} to ${newAmount}. Status changed to: ${newPaymentStatus}${
          existingRevenue ? ". Revenue entry also deleted." : ""
        }`,
      });

      return responseHandler.success(res, "Credit note deleted successfully", {
        deletedCreditNote: salesCreditnote,
        updatedInvoice: {
          id: invoice.id,
          previousAmount: previousAmount,
          newAmount: newAmount,
          restoredAmount: creditNoteAmount,
          previousStatus: invoice.payment_status,
          newStatus: newPaymentStatus,
          revenueDeleted: existingRevenue ? true : false,
        },
      });
    } catch (error) {
      console.error("Delete Credit Note Error:", error);
      return responseHandler.error(
        res,
        error?.message || "Failed to delete credit note"
      );
    }
  },
};
