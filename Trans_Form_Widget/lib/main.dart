import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: _TransFormWidget(),
    ));

class _TransFormWidget extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _TransFormWidgetState();
  }
}

class _TransFormWidgetState extends State<_TransFormWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransForm Widget'),
      ),
      body: Center(
        // child: Transform.rotate(
        //   angle: pi / 4,

        // child: Transform.scale(
        //   scale: 2.0,
        child: Transform.translate(
          offset: Offset(50, 100),
          child: Container(
            height: 150,
            width: 150,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
