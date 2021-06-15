import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.all(10),
        child: Text(
          'Drawer',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
