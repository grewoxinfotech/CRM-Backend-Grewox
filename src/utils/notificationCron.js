import cron from 'node-cron';
import Notification from '../models/notificationModel.js';
import { Op } from 'sequelize';

// Function to check and process notifications
const processNotifications = async () => {
    try {
        const currentDate = new Date();
        const formattedCurrentDate = currentDate.toISOString().split('T')[0];
        const currentTime = currentDate.toLocaleTimeString('en-US', { hour12: false });

        // console.log('Checking notifications:', {
        //     currentDate: formattedCurrentDate,
        //     currentTime
        // });

        // Get all unread notifications
        const notifications = await Notification.findAll({
            where: {
                read: false
            }
        });

        // Process each notification
        for (const notification of notifications) {
            try {
                if (notification.notification_type === 'reminder') {
                    const reminderDate = notification.date ? new Date(notification.date).toISOString().split('T')[0] : null;
                    const reminderTime = notification.time;

                    // Check if reminder should be shown based on date and time
                    const isDatePassed = reminderDate < formattedCurrentDate;
                    const isSameDate = reminderDate === formattedCurrentDate;
                    const isTimePassed = reminderTime <= currentTime;
                    const shouldShowReminder = isDatePassed || (isSameDate && isTimePassed);

                    // console.log('Processing reminder:', {
                    //     id: notification.id,
                    //     title: notification.title,
                    //     scheduledDate: reminderDate,
                    //     scheduledTime: reminderTime,
                    //     currentDate: formattedCurrentDate,
                    //     currentTime: currentTime,
                    //     isDatePassed,
                    //     isSameDate,
                    //     isTimePassed,
                    //     shouldShow: shouldShowReminder
                    // });

                    if (shouldShowReminder) {
                        // Here you can emit the reminder or handle it as needed
                        // console.log('Reminder is due:', {
                        //     id: notification.id,
                        //     title: notification.title,
                        //     message: notification.message,
                        //     users: JSON.parse(notification.users || '[]')
                        // });
                    }
                } else {
                    // For normal notifications, just process them
                    // console.log('Processing normal notification:', {
                    //     id: notification.id,
                    //     title: notification.title,
                    //     message: notification.message,
                    //     users: JSON.parse(notification.users || '[]')
                    // });
                }
            } catch (error) {
                console.error(`Error processing notification ${notification.id}:`, error);
            }
        }
    } catch (error) {
        console.error('Error in notification cron:', error);
    }
};

// Run every 30 seconds to check notifications
const minuteCron = cron.schedule('*/30 * * * * *', () => {
    processNotifications();
});

export const startNotificationCrons = () => {
    minuteCron.start();
    console.log('Notification cron jobs started');
};

export const stopNotificationCrons = () => {
    minuteCron.stop();
    console.log('Notification cron jobs stopped');
}; 