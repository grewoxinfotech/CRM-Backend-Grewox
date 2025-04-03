import Joi from "joi";
import SalesInvoice from "../../models/salesInvoiceModel.js";
import Product from "../../models/productModel.js";
import SalesRevenue from "../../models/salesRevenueModel.js";
import validator from "../../utils/validator.js";
import responseHandler from "../../utils/responseHandler.js";
import Activity from "../../models/activityModel.js";

export default {
    validator: validator({
        params: Joi.object({
            id: Joi.string().required()
        }),
        body: Joi.object({
            customer: Joi.string().required(),
            issueDate: Joi.date().required(),
            dueDate: Joi.date().required(),
            category: Joi.string().optional().allow("", null),
            items: Joi.array().items(
                Joi.object({
                    product_id: Joi.string().required(),
                    quantity: Joi.number().integer().min(1).required(),
                    unit_price: Joi.number().min(0).required(),
                    tax_rate: Joi.number().min(0).optional(),
                    discount: Joi.number().min(0).optional()
                })
            ).required().min(1),
            payment_status: Joi.string().valid('paid', 'unpaid', 'partially_paid').default('unpaid'),
            currency: Joi.string().required(),
            additional_notes: Joi.string().optional().allow("", null)
        })
    }),
    handler: async (req, res) => {
        try {
            const { id } = req.params;
            const { 
                customer, 
                issueDate, 
                dueDate, 
                category, 
                items,
                payment_status,
                currency,
                additional_notes
            } = req.body;

            // Find the invoice
            const salesInvoice = await SalesInvoice.findByPk(id);
            if (!salesInvoice) {
                return responseHandler.error(res, "SalesInvoice not found");
            }

            const isBecomingPaid = payment_status === 'paid' && salesInvoice.payment_status !== 'paid';
            const isBecomingUnpaid = payment_status !== 'paid' && salesInvoice.payment_status === 'paid';

            // Calculate costs and verify products
            let total_cost_of_goods = 0;
            let subtotal = 0;
            let total_tax = 0;
            let total_discount = 0;
            let verified_products = [];

            // Parse existing items to revert stock if needed
            const existingItems = JSON.parse(salesInvoice.items);

            // First handle stock updates for existing items if payment status is changing
            if (isBecomingUnpaid) {
                // Add back stock for all existing items
                for (const existingItem of existingItems) {
                    const product = await Product.findByPk(existingItem.product_id);
                    if (product) {
                        await product.update({
                            stock_quantity: product.stock_quantity + existingItem.quantity,
                            updated_by: req.user?.username
                        });
                    }
                }
            }

            // Verify and process each new item
            for (const item of items) {
                const product = await Product.findByPk(item.product_id);
                if (!product) {
                    return responseHandler.error(res, `Product with ID ${item.product_id} not found`);
                }

                // Find existing item quantity if any
                const existingItem = existingItems.find(ei => ei.product_id === item.product_id);
                const quantityDiff = item.quantity - (existingItem?.quantity || 0);

                // If becoming paid, verify stock for full quantity
                if (isBecomingPaid) {
                    if (product.stock_quantity < item.quantity) {
                        return responseHandler.error(res, `Insufficient stock for product ${product.name}`);
                    }
                }
                // If staying paid or unpaid, only verify additional quantity
                else if (!isBecomingUnpaid && quantityDiff > 0) {
                    if (product.stock_quantity < quantityDiff) {
                        return responseHandler.error(res, `Insufficient stock for product ${product.name}`);
                    }
                }

                // Verify selling price is not less than buying price
                if (item.unit_price < product.buying_price) {
                    return responseHandler.error(res, `Selling price (${item.unit_price}) cannot be less than buying price (${product.buying_price}) for product ${product.name}`);
                }

                // Calculate item level metrics
                const item_cost = product.buying_price * item.quantity;
                const item_subtotal = item.unit_price * item.quantity;
                const item_tax = item.tax_rate ? (item_subtotal * item.tax_rate / 100) : 0;
                const item_discount = item.discount || 0;
                const item_total = item_subtotal + item_tax - item_discount;
                const item_profit = item_total - item_cost;
                const item_profit_percentage = item_cost > 0 ? ((item_profit) / item_cost) * 100 : 0;

                // Update running totals
                total_cost_of_goods += item_cost;
                subtotal += item_subtotal;
                total_tax += item_tax;
                total_discount += item_discount;

                // Add to verified products
                verified_products.push({
                    ...item,
                    name: product.name,
                    buying_price: product.buying_price,
                    subtotal: item_subtotal,
                    tax_amount: item_tax,
                    total: item_total,
                    profit: item_profit,
                    profit_percentage: item_profit_percentage.toFixed(2)
                });

                // Update product stock if becoming paid
                if (isBecomingPaid) {
                    await product.update({
                        stock_quantity: product.stock_quantity - item.quantity,
                        updated_by: req.user?.username
                    });
                }
            }

            // Calculate final totals
            const total = subtotal + total_tax - total_discount;
            const total_profit = total - total_cost_of_goods;
            const profit_percentage = total_cost_of_goods > 0 ? (total_profit / total_cost_of_goods) * 100 : 0;

            // Update invoice
            await salesInvoice.update({
                customer,
                issueDate,
                dueDate,
                category,
                items: verified_products,
                payment_status,
                currency,
                subtotal,
                tax: total_tax,
                discount: total_discount,
                total,
                cost_of_goods: total_cost_of_goods,
                profit: total_profit,
                profit_percentage: profit_percentage.toFixed(2),
                additional_notes,
                updated_by: req.user?.username
            });

            // Create sales revenue entry only when status changes to paid
            if (isBecomingPaid) {
                await SalesRevenue.create({
                    related_id: req.user.id,
                    date: issueDate,
                    currency,
                    amount: total,
                    cost_of_goods: total_cost_of_goods,
                    account: 'sales',
                    customer,
                    description: `Payment for Invoice #${salesInvoice.salesInvoiceNumber}`,
                    category: category || 'Sales',
                    products: verified_products,
                    client_id: req.des?.client_id,
                    created_by: req.user?.username,
                });

                // Log payment received activity
                await Activity.create({
                    related_id: req.user.id,
                    activity_from: "sales_invoice",
                    activity_id: salesInvoice.id,
                    action: "payment_received",
                    performed_by: req.user?.username,
                    client_id: req.des?.client_id,
                    activity_message: `Payment received for invoice ${salesInvoice.salesInvoiceNumber}. Amount: ${total} ${currency}`
                });
            }

            // Log update activity
            await Activity.create({
                related_id: req.user.id,
                activity_from: "sales_invoice",
                activity_id: salesInvoice.id,
                action: "updated",
                performed_by: req.user?.username,
                client_id: req.des?.client_id,
                activity_message: `Sales invoice ${salesInvoice.salesInvoiceNumber} updated for ${total} ${currency} with profit of ${total_profit.toFixed(2)} (${profit_percentage.toFixed(2)}%). Status: ${payment_status}`
            });

            return responseHandler.success(res, "SalesInvoice updated successfully", {
                ...salesInvoice.toJSON(),
                metrics: {
                    subtotal,
                    tax: total_tax,
                    discount: total_discount,
                    total,
                    cost_of_goods: total_cost_of_goods,
                    profit: total_profit,
                    profit_percentage: profit_percentage.toFixed(2)
                }
            });
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
};
