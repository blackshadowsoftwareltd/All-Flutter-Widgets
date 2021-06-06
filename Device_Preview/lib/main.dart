import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.deepOrange)
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Device Preview'),
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        color: Colors.blue[100],
        // child: DevicePreview(
        //   builder: (context) => ViewPage(),
        // ),
        child: ViewPage(),
      ),
    );
  }
}

class ViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      builder: (context) => Container(
        height: 300,
        width: 200,
        color: Colors.green[100],
        child: Image.asset(
          'images/013242.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
