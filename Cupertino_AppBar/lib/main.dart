import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
          child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CupertinoSliverNavigationBar(
            // padding: EdgeInsetsDirectional.zero,
            largeTitle: Text('Text'),
            leading: Icon(Icons.arrow_back_ios, size: 22),
          )
        ],
        body: Container(),
      ));
}
