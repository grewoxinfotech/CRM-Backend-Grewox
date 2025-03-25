import Joi from "joi";
import SalesCreditnote from "../../models/salesCreditnoteModel.js";
import SalesInvoice from "../../models/salesInvoiceModel.js";
import validator from "../../utils/validator.js";
import responseHandler from "../../utils/responseHandler.js";
import multer from "multer";
import path from "path";
import fs from "fs";

// Configure multer for file upload
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    const uploadDir = "uploads/creditnotes";
    if (!fs.existsSync(uploadDir)) {
      fs.mkdirSync(uploadDir, { recursive: true });
    }
    cb(null, uploadDir);
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + "-" + file.originalname);
  },
});

const upload = multer({ storage: storage });

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
  upload: upload.single("attachment"),
  handler: async (req, res) => {
    try {
      const { id } = req.user;
      const { invoice, date, currency, amount, description } = req.body;

      // Find the related sales invoice
      const salesInvoice = await SalesInvoice.findByPk(invoice);
      if (!salesInvoice) {
        return responseHandler.error(res, "Sales Invoice not found");
      }

      // Check if credit amount is valid
      if (amount > salesInvoice.total) {
        return responseHandler.error(
          res,
          "Credit amount cannot be greater than invoice total"
        );
      }

      // Handle file upload
      let attachmentPath = null;
      if (req.file) {
        attachmentPath = req.file.path;
      }

      // Create credit note
      const salesCreditnote = await SalesCreditnote.create({
        related_id: id,
        invoice,
        date,
        currency,
        amount,
        description,
        attachment: attachmentPath,
        client_id: req.des?.client_id,
        created_by: req.user?.username,
      });

      // Update invoice total
      const updatedTotal = salesInvoice.total - amount;
      await salesInvoice.update({ total: updatedTotal });

      return responseHandler.success(
        res,
        "Sales Credit Note created successfully",
        salesCreditnote
      );
    } catch (error) {
      return responseHandler.error(res, error?.message);
    }
  },
};
