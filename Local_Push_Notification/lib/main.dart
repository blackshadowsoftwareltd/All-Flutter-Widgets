import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:local_push_notification/main.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FlutterLocalNotificationsPlugin flutterNotification;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// android/app/main/res/drawable > app_icon.png
    var androidInitilize = AndroidInitializationSettings('app_icon');
    var iOSInitilize = IOSInitializationSettings();
    var initilizationsSettings =
        InitializationSettings(android: androidInitilize, iOS: iOSInitilize);
    flutterNotification = FlutterLocalNotificationsPlugin();
    flutterNotification.initialize(initilizationsSettings,
        onSelectNotification: notificationSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Local Push Notification')),
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OutlinedButton(
                    child: Text('Get a Notification'),
                    onPressed: getNotification),
                OutlinedButton(
                    child: Text('Get a Schedule Notification after 3 second'),
                    onPressed: getScheduleNotification),
              ],
            )));
  }

  Future notificationSelected(String payload) async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text('notification content\n$payload'),
            ));
  }



  getNotification() async {
    print('pressed');
    var androidDetails = AndroidNotificationDetails(
      'Channel ID',
      'Flutter Developer',
      'this is our chennel',
      importance: Importance.max,
      playSound: true,
      enableVibration: true,
      enableLights: true,
    );
    var iOSDetails =
        IOSNotificationDetails(presentAlert: true, presentSound: true);

    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iOSDetails);
    await flutterNotification.show(0, 'Notification Title', 'Notification Body',
        generalNotificationDetails,
        payload: 'This is a Local Notification');
  }  Future getScheduleNotification() async {
    print('pressed');
    var androidDetails = AndroidNotificationDetails(
      'Channel ID',
      'Flutter Developer',
      'this is our chennel',
      importance: Importance.max,
      playSound: true,
      enableVibration: true,
      enableLights: true,
    );
    var iOSDetails =
        IOSNotificationDetails(presentAlert: true, presentSound: true);

    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iOSDetails);
    var time = DateTime.now().add(Duration(seconds: 3));
    await flutterNotification.schedule(1, 'Schedule Notification',
        'ScheduleNotification body', time, generalNotificationDetails,
        payload: 'This is a Local Schedule Notification');
  }
}
