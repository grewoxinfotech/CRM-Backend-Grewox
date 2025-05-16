import Joi from "joi";
import Task from "../../models/taskModel.js";
import responseHandler from "../../utils/responseHandler.js";
import validator from "../../utils/validator.js";
import User from "../../models/userModel.js";
import { Op } from "sequelize";

export default {
  validator: validator({
    params: Joi.object({
      id: Joi.string().required(),
    }),
    query: Joi.object({
      page: Joi.number().optional(),
      limit: Joi.number().optional(),
    }),
  }),
  handler: async (req, res) => {
    try {
      const { id } = req.params;
      const user = await User.findOne({
        where: { id: req.user.id },
      });

      const tasks = await Task.findAll({
        where: {
          [Op.or]: [{ client_id: user.client_id }, { client_id: user.id }]
        },
      });

      return responseHandler.success(res, "Tasks fetched successfully", tasks);
    } catch (error) {
      return responseHandler.error(res, error?.message);
    }
  },
};
