import FollowupMetting from "../../models/followupMettingModel.js";
import responseHandler from "../../utils/responseHandler.js";
import Joi from "joi";
import validator from "../../utils/validator.js";
import { Op } from "sequelize";

export default {
    validator: validator({
        params: Joi.object({
            id: Joi.string().required()
        }),
        body: Joi.object({
            title: Joi.string().required(),
            meeting_type: Joi.string().valid('offline', 'online').required(),
            venue: Joi.string().optional().allow(null),
            location: Joi.string().optional().allow(null),
            meeting_link: Joi.string().optional().allow(null),
            from_date: Joi.string().required(),
            from_time: Joi.string().required(),
            to_date: Joi.string().required(),
            to_time: Joi.string().required(),
            // host: Joi.string().required(),
            assigned_to: Joi.object({
                assigned_to: Joi.array().items(Joi.string()).required()
            }).required(),
            reminder: Joi.object().allow(null),
            repeat: Joi.object().allow(null),
            participants_reminder: Joi.string().optional().allow(null)
        })
    }),

    handler: async (req, res) => {
        try {
            const { id } = req.params;
            const meetingData = req.body;

            // Find the meeting first
            const meeting = await FollowupMetting.findByPk(id);

            if (!meeting) {
                return responseHandler.error(res, "Meeting not found");
            }

            // Check if meeting with same title exists
            const existingMeeting = await FollowupMetting.findOne({
                where: {
                    title: meetingData.title,
                    id: { [Op.not]: id },
                }
            });

            if (existingMeeting) {
                return responseHandler.error(res, "Meeting with this title already exists");
            }

            // Update the meeting
            await meeting.update({
                ...meetingData,
                updated_by: req.user?.username,
                updated_at: new Date()
            });

            return responseHandler.success(res, "Meeting updated successfully", meeting);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
};
