import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:widget_mask/widget_mask.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: SizedBox(
          width: 250,
          child: WidgetMask(
            blendMode: BlendMode.dstATop,
            childSaveLayer: true,
            mask: Center(
                child: Image.asset(
              'images/fingerprint.png',
              fit: BoxFit.contain,
            )),
            child: Image.network(
              'https://images.unsplash.com/photo-1515446134809-993c501ca304?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80',
              width: 300,
              alignment: Alignment.center,
            ),
          ),
        )));
  }
}
