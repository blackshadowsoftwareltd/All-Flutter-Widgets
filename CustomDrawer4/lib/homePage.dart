import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final VoidCallback openDrawer;

  const HomePage({Key key, this.openDrawer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      appBar: AppBar(
        leading:
            IconButton(icon: Icon(Icons.menu), onPressed: () => openDrawer()),
        backgroundColor: Colors.green[800],
      ),
      body: Center(
        child: Text(
          'Home Page',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
