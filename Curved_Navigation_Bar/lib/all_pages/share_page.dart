import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Share extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Share'),
          backgroundColor: Colors.blue[700],
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.blue),
        ),
      ),
    );
  }
}
