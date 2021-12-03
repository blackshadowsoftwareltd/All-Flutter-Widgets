import 'package:awasome_notificationsa/utilities.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> createNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
        id: 5,
        channelKey: 'basic_channel',
        title:
            '${Emojis.money_money_bag + Emojis.plant_cactus} Text Notification !!!',
        body: 'This is a body',
        // bigPicture:
        //     'https://media-cdn.tripadvisor.com/media/photo-s/15/dd/20/61/al-punto.jpg',
        // bigPicture: 'asset://assets/imgage.extnssion'
        notificationLayout: NotificationLayout.Default,
        payload: {'id': '5', 'contect': 'This is a content'}),
    actionButtons: [
      NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Mark Done',
          buttonType: ActionButtonType.InputField)
    ],
  );
}

Future<void> createReminderNotification(
    NotificationWeekAndTime notificationSchedule) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'scheduled_channel',
          title:
              '${Emojis.wheater_droplet + Emojis.plant_cactus} scheduled Text Notification !!!',
          body: 'This is a scheduled notification body',
          wakeUpScreen: true,
          // bigPicture: 'asset://assets/imgage.extnssion'
          notificationLayout: NotificationLayout.Default,
          payload: {'id': '5', 'contect': 'This is a content'}),
      actionButtons: [
        NotificationActionButton(
            key: 'MARK_DONE',
            label: 'Mark Done',
            buttonType: ActionButtonType.InputField)
      ],

      /// It will help to show the notification at a scheduled time. every day of a week , every hour of a day. and every minute of an hour.
      schedule: NotificationCalendar(
          weekday: notificationSchedule.dayOfTheWeek,
          hour: notificationSchedule.timeOfDay.hour,
          minute: notificationSchedule.timeOfDay.minute + 1,
          second: 0,
          millisecond: 0,

          ///  repeat will repeat every scheduled time.
          repeats: false));
}

Future<void> clearNotifcation() async {
  /// it will cancel the notification
  await AwesomeNotifications().cancel(5);

  /// It will cancel the schedule. not notification.
  // await AwesomeNotifications().cancelAllSchedules();
}
