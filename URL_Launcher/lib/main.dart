import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    const link = 'https://www.facebook.com/Remonahammad.personal/';
    return Scaffold(
      appBar: AppBar(
        title: Text('URL Launcher'),
      ),
      body: Center(
        child: FlatButton(
          child: Text(
            'Remon Ahammad >> Facebook',
            style: TextStyle(fontSize: 18),
          ),
          onPressed: () {
            launch(link);
          },
        ),
      ),
    );
  }
}
