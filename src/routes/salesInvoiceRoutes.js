import { Router } from "express";
import { createSalesInvoice, deleteSalesInvoice, getAllSalesInvoice, getSalesInvoiceById, updateSalesInvoice } from "../controllers/salesInvoiceControllers/index.js";
import { authenticateUser, checkRole } from "../middlewares/index.js";
import passCompanyDetails from '../middlewares/passCompanyDetail.js';
const router = Router();


router.use(authenticateUser, checkRole, passCompanyDetails);

router.post("/:id", createSalesInvoice.validator, createSalesInvoice.handler);
router.get("/:id", getAllSalesInvoice.validator, getAllSalesInvoice.handler);
router.get("/single/:id", getSalesInvoiceById.validator, getSalesInvoiceById.handler);
router.put("/:id", updateSalesInvoice.validator, updateSalesInvoice.handler);
router.delete("/:id", deleteSalesInvoice.validator, deleteSalesInvoice.handler);


export default router;