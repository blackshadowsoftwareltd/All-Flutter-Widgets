import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  DateTime lastPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Double Tap To Close & Exit APP')),
      body: WillPopScope(
        onWillPop: () async {
          final now = DateTime.now();
          final maxDuration = Duration(seconds: 2);
          final isWarning =
              lastPressed == null || now.difference(lastPressed) > maxDuration;

          if (isWarning) {
            lastPressed = DateTime.now();

            final snackBar = SnackBar(
              content: Text('Double Tap To Close App'),
              duration: maxDuration,
            );
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(snackBar);
            return false;
          } else
            return true;
        },
        child: Container(
          child: Center(
            child: OutlinedButton(
              child: Text('Close App'),
              onPressed: () {
                if (Platform.isAndroid)
                  SystemNavigator.pop();
                else
                  print('iOS');

                /// if I use exit(0) Apple will suspend from AppleStore
                // exit(0);
              },
            ),
          ),
        ),
      ),
    );
  }
}
