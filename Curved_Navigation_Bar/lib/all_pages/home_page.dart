import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('home'),
          backgroundColor: Colors.green[700],
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.green),
        ),
      ),
    );
  }
}
