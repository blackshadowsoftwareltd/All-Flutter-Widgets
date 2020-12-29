import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
          backgroundColor: Colors.yellow[700],
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.yellow),
        ),
      ),
    );
  }
}
