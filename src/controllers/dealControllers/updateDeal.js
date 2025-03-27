import Joi from "joi";
import Deal from "../../models/dealModel.js";
import responseHandler from "../../utils/responseHandler.js";
import validator from "../../utils/validator.js";
import { Op } from "sequelize";

export default {
    validator: validator({
        params: Joi.object({
            id: Joi.string().optional()
        }),
        body: Joi.object({
              
                leadTitle: Joi.string().optional().allow(null),
                firstName: Joi.string().optional().allow(null),
                lastName: Joi.string().optional().allow(null),
                email: Joi.string().optional().allow(null),
                phone: Joi.string().optional().allow(null),
                dealName: Joi.string().optional().allow(null),
                pipeline: Joi.string().optional().allow("",null),
                stage: Joi.string().optional().allow("",null),
                label: Joi.string().optional().allow("",null),
                value: Joi.number().optional().allow("",null),
                status: Joi.string().optional().allow("",null),
                currency: Joi.string().optional().allow("",null),
                closedDate: Joi.date().optional().allow("",null),
                company_name: Joi.string().optional().allow("",null),
                address: Joi.string().optional().allow("",null),
                website: Joi.string().optional().allow("",null),
                assigned_to: Joi.object({
                    assigned_to: Joi.array().items(Joi.string()).optional()
                }).optional().allow("",null),
                source: Joi.string().optional().allow("",null),
                project: Joi.string().optional().allow("",null),
        
        })
    }),
    handler: async (req, res) => {
        try {
            const { id } = req.params;
            const updateData = req.body;
            const deal = await Deal.findByPk(id);
            if (!deal) {
                return responseHandler.notFound(res, "Deal not found");
            }
            await deal.update({ ...updateData, updated_by: req.user?.username });
            return responseHandler.success(res, "Deal updated successfully", deal);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
}