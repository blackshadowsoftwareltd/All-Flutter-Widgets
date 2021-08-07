import 'package:fctest/secondScreen.dart';
import 'package:fctest/service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///
  await Firebase.initializeApp();

  /// this method receive message when app background
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  ///
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
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
      print(route);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SecondScreen()));
    });

    /// for Foregrounds
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? androidNotification = message.notification!.android;
      if (notification != null && androidNotification != null && !kIsWeb) {
        print('${notification.title} <> ${notification.body}');
      }
      LocalNotificationService.displayNotification(message);
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
}

/// this method receive message when app background
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
  print(message.notification!.body);
}
