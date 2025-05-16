// import Joi from "joi";
// import Role from "../../models/roleModel.js";
// import validator from "../../utils/validator.js";
// import responseHandler from "../../utils/responseHandler.js";

// export default {
//     validator: validator({
//         query: Joi.object({
//             page: Joi.number().optional(),
//             limit: Joi.number().optional()
//         })
//     }),
//     handler: async (req, res) => {
//         try {
//             const roles = await Role.findAll();
//             return responseHandler.success(res, 'Roles fetched successfully', roles);
//         } catch (error) {
//             return responseHandler.error(res, error?.message);
//         }
//     }
// }









import Joi from "joi";
import Role from "../../models/roleModel.js";
import validator from "../../utils/validator.js";
import responseHandler from "../../utils/responseHandler.js";
import User from "../../models/userModel.js";
import { Op } from "sequelize";

export default {
    validator: validator({
        query: Joi.object({
            page: Joi.number().optional(),
            limit: Joi.number().optional()
        })
    }),
    handler: async (req, res) => {
        try {
            const user = await User.findOne({
                where: { id: req.user.id }
            });

            const roles = await Role.findAll({
                where: {
                    [Op.or]: [{ client_id: user.client_id }, { client_id: user.id }]
                }
            });

            return responseHandler.success(res, "Roles fetched successfully", roles);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
}