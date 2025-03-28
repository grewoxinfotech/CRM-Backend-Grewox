import Joi from "joi";
import Deal from "../../models/dealModel.js";
import responseHandler from "../../utils/responseHandler.js";
import validator from "../../utils/validator.js";
import uploadToS3 from "../../utils/uploadToS3.js";

export default {
    validator: validator({
        params: Joi.object({
            id: Joi.string().required()
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
            files: Joi.array().items(Joi.object({
                filename: Joi.string().required(),
                url: Joi.string().required()
            })).optional(),
            assigned_to: Joi.object({
                assigned_to: Joi.array().items(Joi.string()).optional()
            }).optional().allow("",null),
            products: Joi.object({
                products: Joi.array().items(Joi.string()).optional()
            }).optional().allow("",null),
            source: Joi.string().optional().allow("",null),
            project: Joi.string().optional().allow("",null)
        })
    }),
    handler: async (req, res) => {
        try {
            const { id } = req.params;
            const updateData = req.body;
            const uploadedFiles = req.files?.deal_files || [];

            const deal = await Deal.findByPk(id);
            if (!deal) {
                return responseHandler.notFound(res, "Deal not found");
            }

            // Handle file uploads if present
            if (uploadedFiles.length > 0) {
                const currentFiles = typeof deal.files === 'string' 
                    ? JSON.parse(deal.files)
                    : deal.files || [];

                // Check for duplicate filenames
                const duplicateFiles = uploadedFiles.filter(newFile =>
                    currentFiles.some(existingFile => existingFile.filename === newFile.originalname)
                );

                if (duplicateFiles.length > 0) {
                    return responseHandler.error(res, `These files already exist in deal: ${duplicateFiles.map(f => f.originalname).join(', ')}`);
                }

                // Upload new files to S3
                const processedFiles = await Promise.all(
                    uploadedFiles.map(async (file) => {
                        const url = await uploadToS3(file, "deal-files", file.originalname, req.user?.username);
                        return {
                            filename: file.originalname,
                            url: url
                        };
                    })
                );

                // Combine existing and new files
                updateData.files = [...currentFiles, ...processedFiles];
            }

            await deal.update({ 
                ...updateData,
                updated_by: req.user?.username 
            });

            return responseHandler.success(res, "Deal updated successfully", deal);
        } catch (error) {
            return responseHandler.error(res, error?.message);
        }
    }
}