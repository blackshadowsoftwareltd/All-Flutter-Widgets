import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Rich Text',
      home: RichTexts(),
    ));

class RichTexts extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rich Text'),
        ),
        body: Center(
          child: RichText(
              text: TextSpan(
                  text: 'Rich Text is a   ',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                  children: [
                TextSpan(
                    text: 'Widget',
                    style: TextStyle(color: Colors.red, fontSize: 20))
              ])),
        ));
  }
}
