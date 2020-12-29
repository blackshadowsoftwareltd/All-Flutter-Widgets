import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}

_HomeState homePage;

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    homePage = _HomeState();
    return homePage;
  }
}

String data = 'dummy data', data2 = 'data is changed', buttontxt = 'press me';

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text(data), button()],
      ),
    )));
  }
}

class button extends StatefulWidget {
  const button({
    Key key,
  }) : super(key: key);

  @override
  _buttonState createState() => _buttonState();
}

class _buttonState extends State<button> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlatButton(
            child: Text(buttontxt == null ? 'Press' : buttontxt),
            onPressed: () {
              homePage.setState(() {
                data = 'dummy data change';
                data2 = 'data 2';
                buttontxt = 'pressed';
              });
            }),
        Text(data2)
      ],
    );
  }
}
