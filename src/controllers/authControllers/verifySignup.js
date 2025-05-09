import Joi from "joi";
import validator from "../../utils/validator.js";
import responseHandler from "../../utils/responseHandler.js";
import jwt from "jsonwebtoken";
import { EMAIL_FROM, JWT_SECRET } from "../../config/config.js";
import { sendEmail } from "../../utils/emailService.js";
import { getWelcomeEmailTemplate } from "../../utils/emailTemplates.js";
import Role from "../../models/roleModel.js";
import User from "../../models/userModel.js";
import ClientSubscription from "../../models/clientSubscriptionModel.js";
import { seedDefaultLabels } from "../labelControllers/createLabel.js";
import { seedDefaultPipelines } from "../pipelineControllers/createPipeline.js";
import { seedDefaultStages } from "../stageControllers/createStage.js";

export default {
    validator: validator({
        body: Joi.object({
            otp: Joi.string().length(6).required()
        })
    }),

    handler: async (req, res) => {
        try {
            const { otp } = req.body;
            const user = req.user;

            const { subscription } = req;

            if (user.type !== 'signup_verification') {
                return responseHandler.unauthorized(res, "Invalid verification token");
            }

            if (String(user.verificationOTP) !== String(otp)) {
                return responseHandler.unauthorized(res, "Invalid OTP");
            }

            if (Date.now() > user.verificationOTPExpiry) {
                return responseHandler.unauthorized(res, "OTP has expired");
            }

            const role = await Role.findOne({ where: { id: user.role_id } });
            if (!role) {
                return responseHandler.error(res, "Role not found");
            }

            // Create verified user
            const newUser = role.role_name === 'employee' ? await User.create({
                username: user.username,
                email: user.email,
                password: user.password,
                accounttype: user.accounttype,
                role_id: role.id,
                isEmailVerified: true,
                firstName: user.firstName,
                lastName: user.lastName,
                phone: user.phone,
                phoneCode: user.phoneCode,
                currency: user.currency,
                address: user.address,
                gender: user.gender,
                joiningDate: user.joiningDate,
                leaveDate: user.leaveDate,
                branch: user.branch,
                department: user.department,
                designation: user.designation,
                salary: user.salary,
                accountholder: user.accountholder,
                accountnumber: user.accountnumber,
                bankname: user.bankname,
                ifsc: user.ifsc,
                banklocation: user.banklocation,
                profilePic: user.profilePic,
                e_signatures: user.e_signatures,
                documents: user.documents,
                links: user.links,
                client_id: user.client_id,
                created_by: user.created_by
            }) : await User.create({
                username: user.username,
                email: user.email,
                password: user.password,
                accounttype: user.accounttype,
                role_id: role.id,
                client_id: user.client_id,
                client_plan_id: user.client_plan_id,
                isEmailVerified: true,
                created_by: user.created_by
            });

            // If this is a client, seed their data
            if (role.role_name === 'client') {
                try {
                    const labelTypes = ['source', 'status', 'tag', 'contract_type', 'category', 'followup', 'label'];
                    const labelResults = await Promise.all(labelTypes.map(async type => {
                        try {
                            const labels = await seedDefaultLabels(
                                newUser.id,    // related_id
                                newUser.id,    // client_id
                                'system',      // created_by
                                type          // label type
                            );
                            return { type, count: labels.length, success: true };
                        } catch (error) {
                            console.error(`Error seeding ${type} labels:`, error.message);
                            return { type, count: 0, success: false, error: error.message };
                        }
                    }));

                    const pipelines = await seedDefaultPipelines(
                        newUser.id,       // client_id
                        newUser.username  // created_by
                    );

                    const stageResults = await Promise.all(pipelines.map(async pipeline => {
                        try {
                            const stages = await seedDefaultStages(
                                pipeline.id,    // pipeline_id
                                newUser.id,     // client_id
                                newUser.username // created_by
                            );
                            return {
                                pipeline_name: pipeline.pipeline_name,
                                stages_count: stages.length,
                                success: true
                            };
                        } catch (error) {
                            console.error(`Error seeding stages for pipeline ${pipeline.pipeline_name}:`, error.message);
                            return {
                                pipeline_name: pipeline.pipeline_name,
                                stages_count: 0,
                                success: false,
                                error: error.message
                            };
                        }
                    }));

                } catch (error) {
                    console.error('Error in client data seeding:', error.message);
                }
            }

            //increment user/client count if subscription exists
            if (subscription) {
                const clientSubscription = await ClientSubscription.findByPk(subscription.id);
                if (clientSubscription) {
                    if (role.role_name === 'sub-client') {
                        await clientSubscription.increment('current_clients_count');
                    } else if (!['super-admin', 'client'].includes(role.role_name)) {
                        await clientSubscription.increment('current_users_count');
                    }
                }
            }

            // After creating the new user, generate a login token
            const token = jwt.sign(
                {
                    id: newUser.id,
                    role: role.role_name,
                },
                JWT_SECRET,
                { expiresIn: '24h' }
            );

            // Send welcome email
            const welcomeTemplate = getWelcomeEmailTemplate(newUser.username);
            await sendEmail(newUser.email, 'Welcome to CRM!', welcomeTemplate);

            return responseHandler.success(res, "Registration completed successfully", {
                success: true,
                token,
                user: newUser
            });
        } catch (error) {
            return responseHandler.internalServerError(res, error);
        }
    }
};


