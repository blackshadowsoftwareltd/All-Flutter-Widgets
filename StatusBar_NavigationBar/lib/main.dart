import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isStatusBar = false;
  bool isNabBar = false;

  @override
  Widget build(BuildContext context) {
    isStatusBar
        ? SystemChrome.setEnabledSystemUIOverlays([])
        : SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    final style = SystemUiOverlayStyle(
        systemNavigationBarDividerColor: Colors.deepOrange,
        systemNavigationBarColor: Colors.deepOrange);
    SystemChrome.setSystemUIOverlayStyle(style);
    return Scaffold(
        appBar: AppBar(title: Text('StatusBar & NavigationBar')),
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OutlinedButton(
                      child: Text('StatusBar'),
                      onPressed: () =>
                          setState(() => isStatusBar = !isStatusBar)),
                  OutlinedButton(child: Text('NavigationBar Green')),
                ])));
    Future setBottomNabigationBarColor() async {}
  }
}
