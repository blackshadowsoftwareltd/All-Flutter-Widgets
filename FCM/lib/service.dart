import 'package:fctest/secondScreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  ///
  static final FlutterLocalNotificationsPlugin plugin =
      FlutterLocalNotificationsPlugin();

  ///
  static void initialize(BuildContext context) {
    ///
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"));

    /// initializationSettings for terminated screen
    /// onSelectNotification for foreground screen
    plugin.initialize(initializationSettings,
        onSelectNotification: (String? route) async {
      if (route != null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SecondScreen()));
      }
    });
  }

  ///
  static void displayNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final NotificationDetails details = NotificationDetails(
          android: AndroidNotificationDetails(
              'blackshadow', 'channer', 'this is descriptions',
              importance: Importance.max, priority: Priority.high));

      ///
      await plugin.show(
          id, message.notification!.title, message.notification!.body, details,
          payload: message.data['rout']);
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
