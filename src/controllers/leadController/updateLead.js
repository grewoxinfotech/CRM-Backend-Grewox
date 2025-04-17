import Lead from "../../models/leadModel.js";
import Activity from "../../models/activityModel.js";
import responseHandler from "../../utils/responseHandler.js";
import Joi from "joi";
import validator from "../../utils/validator.js";
import User from "../../models/userModel.js";

export default {
    validator: validator({
        params: Joi.object({
            id: Joi.string().required()
        }),
        body: Joi.object({
            leadTitle: Joi.string().allow('', null),
            leadStage: Joi.string().allow('', null),
            pipeline: Joi.string().allow('', null),
            currency: Joi.string().allow('', null),
            leadValue: Joi.number().allow('', null),
            source: Joi.string().allow('', null),
            company_name: Joi.string().allow('', null),
            firstName: Joi.string().allow('', null),
            lastName: Joi.string().allow('', null),
            phoneCode: Joi.string().allow('', null),
            telephone: Joi.string().allow('', null),
            email: Joi.string().email().allow('', null),
            address: Joi.string().allow('', null),
            interest_level: Joi.string().allow('', null),
            lead_members: Joi.object().allow(null),
            category: Joi.string().allow('', null),
            is_converted: Joi.boolean().allow(null),
            status: Joi.string().allow('', null),
        })
    }),
    
    handler: async (req, res) => {
        try {
            const { id } = req.params;
            const updateData = req.body;

            const lead = await Lead.findByPk(id);
            if (!lead) {
                return responseHandler.notFound(res, "Lead not found");
            }

            // Check if lead members are being updated
            if (updateData.lead_members) {
                const currentLeadMembers = typeof lead.lead_members === 'string'
                    ? JSON.parse(lead.lead_members)
                    : lead.lead_members || { assigned_to: [] };
                
                const currentMembers = currentLeadMembers.assigned_to || [];
                const newMembers = updateData.lead_members.assigned_to || [];
                
                // Find newly added members
                const addedMembers = newMembers.filter(memberId => !currentMembers.includes(memberId));
                
                // Create activity for each newly added member
                if (addedMembers.length > 0) {
                    // Fetch member names from User model
                    const memberUsers = await User.findAll({
                        where: {
                            id: addedMembers
                        },
                        attributes: ['id', 'username']
                    });

                    const memberNames = memberUsers.map(user => user.username).join(', ');
                    
                    await Activity.create({
                        related_id: id,
                        activity_from: "lead_member",
                        activity_id: lead.id,
                        action: "added",
                        performed_by: req.user?.username,
                        client_id: req.des?.client_id,
                        activity_message: `Members ${memberNames} added to lead successfully`
                    });
                }
            }

            await lead.update({
                ...updateData,
                updated_by: req.user?.username
            });

            return responseHandler.success(res, "Lead updated successfully!", lead);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
}
