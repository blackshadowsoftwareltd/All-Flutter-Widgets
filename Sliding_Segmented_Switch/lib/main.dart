import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? framworkValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Sliding Segmented Switch')),
        body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(5),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ///
                  CupertinoSlidingSegmentedControl<int>(
                      backgroundColor: Colors.grey.shade200,
                      thumbColor: Colors.green.shade200,
                      padding: EdgeInsets.all(5),
                      groupValue: framworkValue,
                      children: {
                        0: framworkText('Native'),
                        1: framworkText('iOS'),
                        2: framworkText('Flutter'),
                      },
                      onValueChanged: (value) => setState(() {
                            print(value);
                            framworkValue = value;
                          }))
                ])));
  }

  Widget framworkText(label) => Container(
      padding: EdgeInsets.all(5),
      child: Text(label, style: TextStyle(fontSize: 16)));
}
