import 'package:flutter/material.dart';

import 'User.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List users = List.from(allUsers);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        reverse: true,
        children: [
          Contents('1, Resel'),
          Contents('2, Asad'),
          Contents('3, Rakib'),
          Contents('4, Hasan'),
          Contents('5, Razu'),
          Contents('6, jakir'),
          Contents('7, Sabur'),
          Contents('8, Tanjim'),
        ].reversed.toList(),
      ),
    );
  }

  Widget Contents(String title) => Container(
      height: 50,
      alignment: Alignment.center,
      margin: EdgeInsets.all(3),
      color: Colors.blue,
      child: Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ));
}
