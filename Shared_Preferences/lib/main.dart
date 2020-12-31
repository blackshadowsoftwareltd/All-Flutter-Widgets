import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shared Preference')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('you have clicked $counter time', style: TextStyle(fontSize: 25))
      ])),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          child: Icon(Icons.add),
          onPressed: () => _increment()),
    );
  }

  _increment() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      counter++;
      preferences.setInt('counter', counter);
    });
  }

  _loadCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      counter = preferences.getInt('counter') ?? 0;
    });
  }
}
