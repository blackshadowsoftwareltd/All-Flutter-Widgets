import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int value = 5;
  @override
  Widget build(BuildContext context) {
    final data = List<int>.generate(value, (index) => index);
    return Scaffold(
        appBar: AppBar(title: Text('Refresh Indecator')),
        body: RefreshIndicator(
          onRefresh: refreshNow,
          backgroundColor: Colors.grey.shade50,
          color: Colors.grey, strokeWidth: 3, displacement: 10, edgeOffset: 0,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,

          ///
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.all(5),
                    child: Text('${1 + index}'),
                    margin: EdgeInsets.all(10),
                    color: Colors.green.shade100,
                  )),
        ));
  }

  Future<void> refreshNow() async => Future.delayed(
      Duration(seconds: 1), () => setState(() => value = value + 5));
}
