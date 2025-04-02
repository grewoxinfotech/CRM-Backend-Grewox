import Joi from "joi";
import Salary from "../../models/SalaryModel.js";
import validator from "../../utils/validator.js";
import responseHandler from "../../utils/responseHandler.js";
import { Op } from "sequelize";

export default {
    validator: validator({
        params: Joi.object({
            id: Joi.string().required()
        }),
        body: Joi.object({
            status: Joi.string().required().allow('paid'),
            paymentDate: Joi.date().required(),
            currency: Joi.string().required(),
            netSalary: Joi.string().required(),
            salary: Joi.string().required(),
            bankAccount: Joi.string().required(),
            employeeId: Joi.string().required(),
        })
    }),
    handler: async (req, res) => {
        try {
            const { id } = req.params;
            const { status, paymentDate, currency, netSalary, salary, bankAccount, employeeId } = req.body;
            const salaryData = await Salary.findByPk(id);
            if (!salaryData) {
                return responseHandler.error(res, "Salary not found");
            }
            const existingSalary = await Salary.findOne({ where: { employeeId: salaryData.employeeId, id: { [Op.not]: id } } });
            if (existingSalary) {
                return responseHandler.error(res, "Salary already exists");
            }
            await salaryData.update({
                status,
                paymentDate,
                currency,
                netSalary,
                salary,
                bankAccount,
                employeeId,
                updated_by: req.user?.username
            });
            return responseHandler.success(res, "Salary updated successfully", salaryData);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
}