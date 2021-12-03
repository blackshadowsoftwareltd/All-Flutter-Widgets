import 'package:awasome_notificationsa/notifications.dart';
import 'package:awasome_notificationsa/utilities.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  notificationInit();
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getPermissionForNotification(context);
    listenNotificationsStream(context);
  }

  @override
  void dispose() {
    super.dispose();
    AwesomeNotifications().createdSink.close();
    AwesomeNotifications().createdSink.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              const OutlinedButton(
                  onPressed: createNotification, child: Text('Siimple')),
              OutlinedButton(
                  onPressed: () {
                    final _now = TimeOfDay.now();
                    final _weekday = DateTime.now().weekday;
                    NotificationWeekAndTime? _notificationSchedul =
                        NotificationWeekAndTime(
                            timeOfDay: _now, dayOfTheWeek: _weekday);
                    createReminderNotification(_notificationSchedul);
                  },
                  child: const Text('Schedul')),
              const OutlinedButton(
                  onPressed: clearNotifcation, child: Text('clear')),
            ])));
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
    );
  }
}

/// day start a MonDay
//  List<String> weekdays = [
//    'Mon',
//    'Tue',
//    'Wed',
//    'Thu',
//    'Fri',
//    'Sat',
//    'Sun'
//  ];

/// to get todays weekday
// DateTime.now().weekday