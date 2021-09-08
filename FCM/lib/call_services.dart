import 'package:callkeep/callkeep.dart';
import 'package:fctest/secondScreen.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final FlutterCallkeep _callKeep = FlutterCallkeep();
bool _callKeepStarted = false;

callKeep() async {
  print('<><><>');
  if (!_callKeepStarted) {
    print('<><><><>');
    try {
      await _callKeep.setup(navigatorKey.currentContext, callSetup);
      _callKeepStarted = true;
    } catch (e) {
      print('<><x><>');
      print(e);
    }
  }
  await _callKeep.displayIncomingCall('uuid', 'number');
  print('.........');
  _callKeep.backToForeground();
  // Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen()));
  print('||||||||');
}

final callSetup = <String, dynamic>{
  'ios': {
    'appName': 'CallKeepDemo',
  },
  'android': {
    'alertTitle': 'Permissions required',
    'alertDescription': 'This application needs to access your phone accounts',
    'cancelButton': 'Cancel',
    'okButton': 'ok',
    // Required to get audio in background when using Android 11
    'foregroundService': {
      'channelId': 'com.company.my',
      'channelName': 'Foreground service for my app',
      'notificationTitle': 'My app is running on background',
      'notificationIcon': 'Path to the resource icon of the notification',
    },
  },
};
