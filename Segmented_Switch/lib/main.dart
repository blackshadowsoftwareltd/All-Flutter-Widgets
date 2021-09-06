import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Segmented Switch')),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            CupertinoSegmentedControl<int>(
                groupValue: groupValue,
                selectedColor: Colors.green,
                unselectedColor: Colors.white,
                borderColor: Colors.green,
                pressedColor: Colors.grey.shade300,
                padding: EdgeInsets.all(15),
                children: {
                  0: _text('Header 1'),
                  1: _text('Header 2'),
                  2: _text('Header 3')
                },
                onValueChanged: (value) => setState(() {
                      print(value);
                      this.groupValue = value;
                    })),
            Container(
              margin: EdgeInsets.all(50),
              child: _text(groupValue == 0
                  ? 'Header 1'
                  : groupValue == 2
                      ? 'Header 2'
                      : 'Header 3'),
            )
          ],
        ),
      ),
    );
  }

  Widget _text(label) =>
      Container(padding: EdgeInsets.all(10), child: Text(label));
}
