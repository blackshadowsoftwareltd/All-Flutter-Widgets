import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
title: Text('Doted Border')
),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            dashedBorder1(),
            dashedBorder2(),
            dashedBorder3(),
            dashedBorder4(),
          dashedBorder5(),dashedBorder6(),]),
        ),
      ),
    );
  }

  Widget dashedBorder1() => DottedBorder(
      color: Colors.red,
      strokeWidth: 4,
      radius: Radius.circular(20),
      borderType: BorderType.RRect,
      child: Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        // color: Colors.green,
        child: Text('DottedBorder'),
      ));
  Widget dashedBorder2() => DottedBorder(
      color: Colors.red,
      strokeWidth: 4,
      borderType: BorderType.Circle,
      child: Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        // color: Colors.green,
        child: Text('DottedBorder'),
      ));
  Widget dashedBorder3() => DottedBorder(
      color: Colors.red,
      strokeWidth: 4,
      borderType: BorderType.Rect,
      child: Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        // color: Colors.green,
        child: Text('DottedBorder'),
      ));
  Widget dashedBorder4() => DottedBorder(
      color: Colors.red,
      strokeWidth: 4,
      borderType: BorderType.Circle,
      dashPattern: [20, 5],
      child: Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        // color: Colors.green,
        child: Text('DottedBorder'),
      ));
  Widget dashedBorder5() => DottedBorder(
      color: Colors.red,
      strokeWidth: 4,
      borderType: BorderType.Circle,
      dashPattern: [15, 10,5,10],
      child: Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        // color: Colors.green,
        child: Text('DottedBorder'),
      ));
  Widget dashedBorder6() => DottedBorder(
      color: Colors.red,
      strokeWidth: 10,
      strokeCap: StrokeCap.round,
      borderType: BorderType.Circle,
      dashPattern: [5, 20],
      child: Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        // color: Colors.green,
        child: Text('DottedBorder'),
      ));
}
