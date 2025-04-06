import Email from "../../models/emailModel.js";
import EmailSettings from "../../models/emailSettingModel.js";
import responseHandler from "../../utils/responseHandler.js";
import Joi from "joi";
import validator from "../../utils/validator.js";
import nodemailer from 'nodemailer';

export default {
    validator: validator({
        body: Joi.object({
            to: Joi.string().email().required(),
            subject: Joi.string().required(),
            html: Joi.string().optional(),
            attachments: Joi.array().items(Joi.object()).optional(),
            type: Joi.string().valid('inbox', 'sent', 'trash').default('sent'),
            isRead: Joi.boolean().default(false),
            isStarred: Joi.boolean().default(false),
            isImportant: Joi.boolean().default(false),
            scheduledFor: Joi.date().optional().allow(null),
        })
    }),

    handler: async (req, res) => {
        try {
            const { 
                to, subject, html, attachments,
                type, isRead, isStarred, isImportant,
                scheduledFor
            } = req.body;

            // First find email settings
            const emailSettings = await EmailSettings.findOne({
                where: {
                    client_id: req.des?.client_id,
                    is_active: true
                }
            });

            if (!emailSettings) {
                return responseHandler.error(res, "No active email settings found");
            }

            // Create transporter
            const transporter = nodemailer.createTransport({
                service: 'gmail',
                auth: {
                    user: emailSettings.email,
                    pass: emailSettings.app_password
                }
            });

            // Prepare email data
            const mailOptions = {
                from: `"${req.user?.username || 'System'}" <${emailSettings.email}>`,
                to: to,
                subject: subject,
                html: html || '',
                attachments: attachments || []
            };

            const status = scheduledFor ? 'scheduled' : 'sent';

            // Create email record first
            const email = await Email.create({
                to, 
                subject,
                html: html || '',
                attachments: attachments || [],
                type,
                isRead,
                isStarred,
                isImportant,
                scheduledFor,
                status,
                client_id: req.des?.client_id,
                created_by: req.user?.username,
            });

            // If it's scheduled, don't send now
            if (scheduledFor) {
                return responseHandler.success(res, 'Email scheduled successfully', email);
            }

            // Send email
            try {
                await transporter.sendMail(mailOptions);
                
                // Update email status if sent successfully
                await email.update({ status: 'sent' });

                return responseHandler.success(res, 'Email sent successfully', email);
            } catch (error) {
                // Update email status if failed
                await email.update({ status: 'failed' });
                console.error('Send email error:', error);
                return responseHandler.error(res, "Failed to send email: " + error.message);
            }

        } catch (error) {
            console.error('Controller error:', error);
            return responseHandler.error(res, error?.message || "An error occurred");
        }
    },
};
