import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contact Us'),
          backgroundColor: Colors.purple[700],
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.purple),
        ),
      ),
    );
  }
}
