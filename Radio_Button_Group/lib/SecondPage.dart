import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String _data = 'Untitle';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Group Radio Button')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 5),
            Text(_data, style: TextStyle(fontSize: 25, color: Colors.black)),
            Spacer(flex: 1),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Radio(
                      value: 'Red',
                      groupValue: _data,
                      onChanged: (value) {
                        _data = value;setState(() {
                          
                        });
                      }),
                  Text('Red', style: TextStyle(color: Colors.red, fontSize: 20))
                ]),
            Spacer(flex: 1),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Radio(
                      value: 'Green',
                      groupValue: _data,
                      onChanged: (value) {
                        _data = value;setState(() {
                          
                        });
                      }),
                  Text('Green',
                      style: TextStyle(color: Colors.green, fontSize: 20))
                ]),
            Spacer(flex: 1),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Radio(
                      value: 'Blue',
                      groupValue: _data,
                      onChanged: (value) {
                        _data = value;setState(() {
                          
                        });
                      }),
                  Text('Blue',
                      style: TextStyle(color: Colors.blue, fontSize: 20))
                ]),
            Spacer(flex: 5)
          ],
        ),
      ),
    );
  }
}
