import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
            widthFactor: .1,
            heightFactor: .1,
            child: Container(
              height: 250,
              width: 250,
              decoration:
                  BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
            ),
          ),
    );
  }
}
