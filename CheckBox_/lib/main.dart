import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'ChackBox',
      home: ChackBox(),
    ));

class ChackBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChackBoxState();
    ;
  }
}

class ChackBoxState extends State<ChackBox> {
  bool _value = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Box'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _value == false ? 'UnChecked' : 'Checked',
            style: TextStyle(fontSize: 20),
          ),
          Checkbox(
            value: _value,
            onChanged: (bool value) {
              setState(() {
                _value = value;
              });
            },
          )
        ],
      )),
    );
  }
}
