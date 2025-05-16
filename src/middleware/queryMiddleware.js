import { Op } from "sequelize";
import responseHandler from "../utils/responseHandler.js";
import User from "../models/userModel.js";

const queryMiddleware = searchFields => async (req, res, next) => {
    try {
        const user = await User.findOne({ where: { id: req.user.id } });
        if (!user) return responseHandler.error(res, "User not found");

        const page = Math.max(1, +req.query.page || 1);
        const limit = Math.max(1, Math.min(100, +req.query.pageSize || 10));
        const search = req.query.search?.trim();

        req.queryOptions = {
            limit,
            offset: (page - 1) * limit,
            order: [['createdAt', 'DESC']],
            where: { [Op.or]: [{ client_id: user.client_id }, { client_id: user.id }] }
        };

        if (search && searchFields?.length) {
            req.queryOptions.where[Op.and] = [{
                [Op.or]: searchFields.map(f => ({ [f]: { [Op.like]: `%${search}%` } }))
            }];
        }

        req.pagination = { current: page, pageSize: limit };
        next();
    } catch (e) {
        return responseHandler.error(res, e?.message || "Query failed");
    }
};

export default queryMiddleware; 