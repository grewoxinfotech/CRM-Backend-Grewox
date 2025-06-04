import Lead from "../../models/leadModel.js";
import Activity from "../../models/activityModel.js";
import responseHandler from "../../utils/responseHandler.js";
import Joi from "joi";
import validator from "../../utils/validator.js";
import User from "../../models/userModel.js";
import Notification from "../../models/notificationModel.js";

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
            interest_level: Joi.string().allow('', null),
            lead_members: Joi.object().allow(null),
            category: Joi.string().allow('', null),
            is_converted: Joi.boolean().allow(null),
            status: Joi.string().allow('', null),
            company_id: Joi.string().allow(null),
            contact_id: Joi.string().allow(null),
            inquiry_id: Joi.string().allow(null)
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

            // Store old values before update
            const oldValues = {
                leadTitle: lead.leadTitle,
                leadStage: lead.leadStage,
                pipeline: lead.pipeline,
                currency: lead.currency,
                leadValue: lead.leadValue,
                source: lead.source,
                interest_level: lead.interest_level,
                category: lead.category,
                is_converted: lead.is_converted,
                status: lead.status
            };

            // Check if lead members are being updated
            if (updateData.lead_members) {
                const currentLeadMembers = typeof lead.lead_members === 'string'
                    ? JSON.parse(lead.lead_members)
                    : lead.lead_members || { lead_members: [] };

                const currentMembers = currentLeadMembers.lead_members || [];
                const newMembers = updateData.lead_members.lead_members || [];

                // Find newly added members
                const addedMembers = newMembers.filter(memberId => !currentMembers.includes(memberId));

                // Create activity and notification for each newly added member
                if (addedMembers.length > 0) {
                    // Fetch member names from User model
                    const memberUsers = await User.findAll({
                        where: {
                            id: addedMembers
                        },
                        attributes: ['id', 'username']
                    });

                    for (const user of memberUsers) {
                        await Activity.create({
                            related_id: id,
                            activity_from: "lead_member",
                            activity_id: lead.id,
                            action: "added",
                            performed_by: req.user?.username,
                            client_id: req.des?.client_id,
                            activity_message: user.username
                        });

                        // Create notification for added member
                        await Notification.create({
                            related_id: lead.id,
                            users: [user.id],
                            title: "Added to Lead",
                            from: req.user?.id,
                            client_id: req.des?.client_id,
                            message: `You have been added to lead "${lead.leadTitle}"`,
                            description: `💼 Lead Overview:\n• Value: ${lead.currency} ${lead.leadValue}\n• Stage: ${lead.leadStage}\n• Interest Level: ${lead.interest_level}\n• Source: ${lead.source}`,
                            created_by: req.user?.username,
                        });
                    }
                }

                // Find removed members
                const removedMembers = currentMembers.filter(memberId => !newMembers.includes(memberId));

                // Create activity and notification for each removed member
                if (removedMembers.length > 0) {
                    // Fetch member names from User model
                    const memberUsers = await User.findAll({
                        where: {
                            id: removedMembers
                        },
                        attributes: ['id', 'username']
                    });

                    for (const user of memberUsers) {
                        await Activity.create({
                            related_id: id,
                            activity_from: "lead_member",
                            activity_id: lead.id,
                            action: "removed",
                            performed_by: req.user?.username,
                            client_id: req.des?.client_id,
                            activity_message: user.username
                        });

                        // Create notification for removed member
                        await Notification.create({
                            related_id: lead.id,
                            users: [user.id],
                            title: "Removed from Lead",
                            from: req.user?.id,
                            client_id: req.des?.client_id,
                            message: `You have been removed from lead "${lead.leadTitle}"`,
                            created_by: req.user?.username,
                        });
                    }
                }
            }

            await lead.update({
                ...updateData,
                updated_by: req.user?.username
            });

            // Create activity for lead updates
            const changes = [];
            
            if (updateData.leadTitle && updateData.leadTitle !== oldValues.leadTitle) {
                changes.push(`title from "${oldValues.leadTitle}" to "${updateData.leadTitle}"`);
            }
            if (updateData.leadStage && updateData.leadStage !== oldValues.leadStage) {
                changes.push(`stage from "${oldValues.leadStage}" to "${updateData.leadStage}"`);
            }
            if (updateData.pipeline && updateData.pipeline !== oldValues.pipeline) {
                changes.push(`pipeline from "${oldValues.pipeline}" to "${updateData.pipeline}"`);
            }
            if (updateData.currency && updateData.currency !== oldValues.currency) {
                changes.push(`currency from "${oldValues.currency}" to "${updateData.currency}"`);
            }
            if (updateData.leadValue && updateData.leadValue !== oldValues.leadValue) {
                changes.push(`value from "${oldValues.leadValue}" to "${updateData.leadValue}"`);
            }
            if (updateData.source && updateData.source !== oldValues.source) {
                changes.push(`source from "${oldValues.source}" to "${updateData.source}"`);
            }
            if (updateData.interest_level && updateData.interest_level !== oldValues.interest_level) {
                changes.push(`interest level from "${oldValues.interest_level}" to "${updateData.interest_level}"`);
            }
            if (updateData.category && updateData.category !== oldValues.category) {
                changes.push(`category from "${oldValues.category}" to "${updateData.category}"`);
            }
            if (updateData.status && updateData.status !== oldValues.status) {
                changes.push(`status from "${oldValues.status}" to "${updateData.status}"`);
            }
            if (updateData.is_converted !== undefined && updateData.is_converted !== oldValues.is_converted) {
                changes.push(`conversion status to "${updateData.is_converted ? 'converted' : 'not converted'}"`);
            }

            if (changes.length > 0) {
                await Activity.create({
                    related_id: id,
                    activity_from: "lead",
                    activity_id: lead.id,
                    action: "updated",
                    performed_by: req.user?.username,
                    client_id: req.des?.client_id,
                    activity_message: `Updated lead: ${changes.join(', ')}`
                });
            }

            return responseHandler.success(res, "Lead updated successfully!", lead);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
}
