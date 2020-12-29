import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Switch',
      home: _Switch(),
    ));

class _Switch extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _SwitchState();
  }
}

class _SwitchState extends State<_Switch> {
  bool _state = false;
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _state == false ? Colors.green : Colors.blue,
        appBar: AppBar(
          title: Text('Switch'),
        ),
        body: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _state.toString(),
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  width: 20,
                ),
                Switch(
                  value: _state,
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.blue,
                  activeTrackColor: Colors.purple,
                  inactiveTrackColor: Colors.orange,
                  onChanged: (value) {
                    setState(() {
                      _state = value;
                    });
                  },
                ),
              ]),
        ));
  }
}
