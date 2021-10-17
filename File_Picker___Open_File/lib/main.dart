import 'package:file_picker_all_file/Simple/simple_way.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Complex/complex.dart';

void main() => runApp(const MaterialApp(home: ComplexWay()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  navigateTo(context, 'Simple Way', const SimpleWay()),
                  navigateTo(context, 'Complex Way', const ComplexWay())
                ])));
  }

  Widget navigateTo(context, label, Widget widget) => OutlinedButton(
      onPressed: () => Navigator.push(
          context, CupertinoPageRoute(builder: (context) => widget)),
      child: Text(label));
}
