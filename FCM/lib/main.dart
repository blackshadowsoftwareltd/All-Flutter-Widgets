import 'dart:convert';
import 'package:fctest/secondScreen.dart';
import 'package:fctest/service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart'; 
import 'package:flutter/material.dart'; 
import 'package:http/http.dart';

final GlobalKey<NavigatorState> glovalNabKey = new GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///
  await Firebase.initializeApp();

  /// this method receive message when app background
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  ///
  runApp(MaterialApp(
    home: Home(),
    navigatorKey: glovalNabKey,
    initialRoute: '/',
    routes: {
      '/home': (context) => Home(),
      '/second': (context) => SecondScreen(),
    },
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
          child: OutlinedButton(
        child: Text('Send FCM'),
        onPressed: () {
          sendPushMessage();
        },
      )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///
    LocalNotificationService.initialize(context);

    /// app will open when user tap on notification when the app is terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print('pressed the app in  terminated state');
      final route = message?.data['route'];
      print('route : $route');
      if (route != null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SecondScreen()));
      }
    });

    /// for Foregrounds
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? androidNotification = message.notification!.android;
      if (notification != null && androidNotification != null && !kIsWeb) {
        /// message.notification.title or message.notification.body
        print('${notification.title} <> ${notification.body}');

        /// message.data['keyName']
        print('${message.data['time']} <> ${message.data['message']}');
      }
      LocalNotificationService.displayNotification(message);
       glovalNabKey.currentState!.pushNamed('/second');
    });

    /// when the app is background but not closed. not terminated
    /// onTap on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final route = message.data['route'];
      print(route);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SecondScreen()));
    });

    ///
  }

  Future<void> sendPushMessage() async {
    /// getting device token
    final token = await FirebaseMessaging.instance.getToken();

    /// getting firebase server token ->>
    /// settings icon (right side of the Project Overview & home icon) ->>
    /// Cloud Messaging (right side of the General settings) ->>
    /// Server key
    final fireBaseServerToken =
        'AAAA_Ia59cw:APA91bEwgQtig-bkbZQVv0saxC1oHis1nZHfpyPdsaqALOJ1r9u0SIf6G06Moevpu4sNaWJ1FM9l5o85Fu2kWxqD9BAMF0MV6R_wVeoOsh86GXAo-_UEOx02PBdKDh76Tlq02aShgwiR';
    print('TOKEN: $token');
    if (token == null) {
      print('Unable to send FCM message, no token exists');
      return;
    }
    try {
      await post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'key=$fireBaseServerToken',
        },
        body: json.encode({
          'notification': {'body': 'body', 'title': 'title'},
          'priority': 'high',
          'data': {
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'time': DateTime.now().toIso8601String(),
            'message': 'message',
            'call_id': 'callID',
          },
          'to': '$token',
        }),
      );
    } catch (e) {
      print(e.toString());
    }
  }
}

/// this method receive message when app background
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
  print(message.notification!.body);
  print('----------');
  glovalNabKey.currentState!.pushNamed('/second');
  // myNavkey.currentState!
  //     .push(MaterialPageRoute(builder: (context) => SecondScreen()));
  print(glovalNabKey.currentState);
  print('<><><><>');
}
