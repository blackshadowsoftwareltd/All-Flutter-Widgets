// ignore_for_file: avoid_print

import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'main.dart';

int createUniqueId() => DateTime.now().microsecondsSinceEpoch.remainder(100000);

class NotificationWeekAndTime {
  final int dayOfTheWeek;
  final TimeOfDay timeOfDay;

  NotificationWeekAndTime(
      {required this.dayOfTheWeek, required this.timeOfDay});
}

/// Notification init
notificationInit() {
  AwesomeNotifications().initialize(

      /// set the icon to null if you want to use the default app icon
      // 'resource://drawable/res_notification_app_icon',
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic Notifications',
          defaultColor: Colors.blueGrey,
          importance: NotificationImportance.High,
          channelShowBadge: true,
          channelDescription: 'Notification channel for basic tests',
        ),
        NotificationChannel(
          channelKey: 'scheduled_channel',
          channelName: 'Scheduled Notifications',
          defaultColor: Colors.blueGrey,
          importance: NotificationImportance.High,
          channelShowBadge: true,
          channelDescription: 'Notification channel for basic tests',

          /// it will disable to delete notification when the user is swiping right.
          locked: true,

          /// notification sound sourch
          // soundSource: 'resource://res_custom_notification',
        ),
      ],
      debug: true);
}

/// Permission for getting notification. Android by default permitted
/// So Android doesn't show alert dialog initially
getPermissionForNotification(context) =>
    AwesomeNotifications().isNotificationAllowed().then((value) {
      if (value == false) {
        showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(title: const Text('Allow Notifications'), actions: [
                  TextButton(
                      onPressed: () => AwesomeNotifications()
                          .requestPermissionToSendNotifications()
                          .then((_) => Navigator.pop(context)),
                      child: const Text('Allow')),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'))
                ]));
      }
    });
listenNotificationsStream(context) {
  /// create stream
  AwesomeNotifications().createdStream.listen((event) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Notification created on ${event.id}')));
  });

  /// action Stream
  AwesomeNotifications().actionStream.listen((event) {
    if (event.channelKey == 'basic_channel') {
      print(event.buttonKeyInput);
      print(event.title);
      print(event.body);
      print(event.payload);
    }
    if (event.channelKey == 'scheduled_channel') {
      print(event.buttonKeyInput);
      print(event.title);
      print(event.body);
      print(event.payload);
    }

    /// navigate to another screen
    /// iOS
    if (event.channelKey == 'basic_channel' && Platform.isIOS) {
      AwesomeNotifications().getGlobalBadgeCounter().then(
          (value) => AwesomeNotifications().setGlobalBadgeCounter(value - 1));
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SecondScreen()));
  });
}
