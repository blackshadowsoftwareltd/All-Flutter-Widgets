import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Wheel ScrollView '),
      ),
      body: ListWheelScrollView(
        itemExtent: 100,
        diameterRatio: 0.6,
        offAxisFraction: -0.7,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 500,
            color: Colors.blue,
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 200,
            color: Colors.green,
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 200,
            color: Colors.deepPurple,
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 200,
            color: Colors.red,
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 200,
            color: Colors.greenAccent,
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 200,
            color: Colors.purple,
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 200,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
