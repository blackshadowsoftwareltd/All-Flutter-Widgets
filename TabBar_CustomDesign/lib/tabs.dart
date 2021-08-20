import 'dart:math';

import 'package:flutter/material.dart';

class GreenTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.green,
      child: Center(
        child: Container(
          height: 50,
          width: 50,
          color: Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
              .withOpacity(1),
        ),
      ),
    );
  }
}

class OrangeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.deepOrange,child: Center(
        child: Container(
          height: 50,
          width: 50,
          color: Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
              .withOpacity(1),
        ),
      ),
    );
  }
}
