import Joi from "joi";
import Tag from "../../models/labelModel.js";
import validator from "../../utils/validator.js";
import responseHandler from "../../utils/responseHandler.js";

const defaultLabels = [
  // Source labels
  { name: "Email", color: "#FF5733", lableType: "source" },
  { name: "Phone", color: "#33FF57", lableType: "source" },
  { name: "Website", color: "#3357FF", lableType: "source" },
  { name: "Social Media", color: "#FF33F6", lableType: "source" },
  { name: "Referral", color: "#33FFF6", lableType: "source" },
  { name: "Direct", color: "#F6FF33", lableType: "source" },
  { name: "Advertisement", color: "#FF8333", lableType: "source" },
  { name: "Event", color: "#33FF83", lableType: "source" },
  { name: "Partner", color: "#8333FF", lableType: "source" },
  { name: "Other", color: "#FF3333", lableType: "source" },

  // Status labels
  { name: "New", color: "#4CAF50", lableType: "status" },
  { name: "In Progress", color: "#FFC107", lableType: "status" },
  { name: "Pending", color: "#FF9800", lableType: "status" },
  { name: "Completed", color: "#2196F3", lableType: "status" },
  { name: "On Hold", color: "#9C27B0", lableType: "status" },
  { name: "Cancelled", color: "#F44336", lableType: "status" },
  { name: "Delayed", color: "#795548", lableType: "status" },
  { name: "Review", color: "#607D8B", lableType: "status" },
  { name: "Approved", color: "#8BC34A", lableType: "status" },
  { name: "Rejected", color: "#E91E63", lableType: "status" },

  // Tag labels
  { name: "High Priority", color: "#FF0000", lableType: "tag" },
  { name: "Medium Priority", color: "#FFA500", lableType: "tag" },
  { name: "Low Priority", color: "#FFFF00", lableType: "tag" },
  { name: "Urgent", color: "#FF1493", lableType: "tag" },
  { name: "Important", color: "#8A2BE2", lableType: "tag" },
  { name: "Follow-up", color: "#20B2AA", lableType: "tag" },
  { name: "VIP", color: "#FFD700", lableType: "tag" },
  { name: "Special", color: "#DA70D6", lableType: "tag" },
  { name: "Sensitive", color: "#B22222", lableType: "tag" },
  { name: "Regular", color: "#32CD32", lableType: "tag" },
];

export const seedDefaultLabels = async (related_id, client_id) => {
  try {
    const existingTags = await Tag.findAll({
      where: { related_id, client_id }
    });

    if (existingTags.length === 0) {
      const createdTags = await Promise.all(
        defaultLabels.map(async (label) => {
          try {
            return await Tag.create({
              related_id,
              client_id,
              name: label.name,
              color: label.color,
              lableType: label.lableType,
              created_by: "system"
            });
          } catch (error) {
            return null;
          }
        })
      );

      return createdTags.filter(t => t !== null);
    }

    return existingTags;
  } catch (error) {
    throw error;
  }
};

export default {
  validator: validator({
    params: Joi.object({
      id: Joi.string().required(),
    }),
    body: Joi.object({
      name: Joi.string().required(),
      color: Joi.string().allow("", null),
      lableType: Joi.string().allow("", null),
    }),
  }),
  handler: async (req, res) => {
    try {
      const { id } = req.params;
      const { name, color, lableType } = req.body;

      const existingTag = await Tag.findOne({
        where: { related_id: id, name, lableType },
      });
      if (existingTag) {
        return responseHandler.error(res, "Tag with this name already exists");
      }

      const newTag = await Tag.create({
        related_id: id,
        name,
        color,
        lableType,
        client_id: req.des?.client_id,
        created_by: req.user?.username,
      });
      return responseHandler.success(res, "Tag created successfully", newTag);
    } catch (error) {
      return responseHandler.error(res, error?.message);
    }
  },
};
