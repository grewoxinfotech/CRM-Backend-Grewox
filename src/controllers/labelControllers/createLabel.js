import Joi from "joi";
import Tag from "../../models/labelModel.js";
import validator from "../../utils/validator.js";
import responseHandler from "../../utils/responseHandler.js";

const defaultLabels = [
  // Source labels - Professional colors
  { name: "Email", color: "#2C3E50", lableType: "source" },
  { name: "Phone", color: "#34495E", lableType: "source" },
  { name: "Website", color: "#16A085", lableType: "source" },
  { name: "Social Media", color: "#27AE60", lableType: "source" },
  { name: "Referral", color: "#2980B9", lableType: "source" },
  { name: "Direct", color: "#8E44AD", lableType: "source" },
  { name: "Advertisement", color: "#2C3E50", lableType: "source" },
  { name: "Event", color: "#16A085", lableType: "source" },
  { name: "Partner", color: "#27AE60", lableType: "source" },
  { name: "Other", color: "#34495E", lableType: "source" },

  // Status labels - Professional colors
  { name: "New", color: "#1ABC9C", lableType: "status" },
  { name: "In Progress", color: "#3498DB", lableType: "status" },
  { name: "Pending", color: "#9B59B6", lableType: "status" },
  { name: "Completed", color: "#2ECC71", lableType: "status" },
  { name: "On Hold", color: "#34495E", lableType: "status" },
  { name: "Cancelled", color: "#E74C3C", lableType: "status" },
  { name: "Delayed", color: "#95A5A6", lableType: "status" },
  { name: "Review", color: "#7F8C8D", lableType: "status" },
  { name: "Approved", color: "#27AE60", lableType: "status" },
  { name: "Rejected", color: "#C0392B", lableType: "status" },

  // Tag labels - Professional colors
  { name: "High Priority", color: "#C0392B", lableType: "tag" },
  { name: "Medium Priority", color: "#D35400", lableType: "tag" },
  { name: "Low Priority", color: "#F39C12", lableType: "tag" },
  { name: "Urgent", color: "#E74C3C", lableType: "tag" },
  { name: "Important", color: "#8E44AD", lableType: "tag" },
  { name: "Follow-up", color: "#16A085", lableType: "tag" },
  { name: "VIP", color: "#2980B9", lableType: "tag" },
  { name: "Special", color: "#8E44AD", lableType: "tag" },
  { name: "Sensitive", color: "#C0392B", lableType: "tag" },
  { name: "Regular", color: "#27AE60", lableType: "tag" },

  // Contract Type labels - Professional colors
  { name: "Fixed Price", color: "#2980B9", lableType: "contract_type" },
  { name: "Time & Material", color: "#16A085", lableType: "contract_type" },
  { name: "Retainer", color: "#D35400", lableType: "contract_type" },
  { name: "Project Based", color: "#27AE60", lableType: "contract_type" },
  { name: "Milestone Based", color: "#8E44AD", lableType: "contract_type" },

  // Category labels - Professional colors
  { name: "Software Development", color: "#2C3E50", lableType: "category" },
  { name: "Consulting", color: "#34495E", lableType: "category" },
  { name: "Design", color: "#16A085", lableType: "category" },
  { name: "Marketing", color: "#27AE60", lableType: "category" },
  { name: "Training", color: "#2980B9", lableType: "category" },
  { name: "E-commerce", color: "#8E44AD", lableType: "category" },
  { name: "Healthcare", color: "#1ABC9C", lableType: "category" },
  { name: "Real Estate", color: "#3498DB", lableType: "category" },
  { name: "Financial Services", color: "#2ECC71", lableType: "category" },
  { name: "Manufacturing", color: "#9B59B6", lableType: "category" },
  { name: "Retail", color: "#E74C3C", lableType: "category" },
  { name: "Education", color: "#95A5A6", lableType: "category" },
  { name: "Hospitality", color: "#7F8C8D", lableType: "category" },
  { name: "Transportation", color: "#D35400", lableType: "category" },
  { name: "Construction", color: "#16A085", lableType: "category" },

  // Common labels - Professional colors
  { name: "Active", color: "#27AE60", lableType: "label" },
  { name: "Inactive", color: "#C0392B", lableType: "label" },
  { name: "Draft", color: "#95A5A6", lableType: "label" },
  { name: "Published", color: "#2980B9", lableType: "label" },
  { name: "Archived", color: "#34495E", lableType: "label" }
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
