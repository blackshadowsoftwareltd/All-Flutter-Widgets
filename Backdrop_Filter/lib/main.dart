import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: _BackdropFilter(),
  ));
}

class _BackdropFilter extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _BackdropFilterState();
  }
}

class _BackdropFilterState extends State<_BackdropFilter> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BackdropFilter'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 200,
              width: 150,
              color: Colors.green,
            ),
            BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.white.withOpacity(0.3),
                ))
          ],
        ),
      ),
    );
  }
}
