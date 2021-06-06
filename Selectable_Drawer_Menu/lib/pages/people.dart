import 'package:flutter/material.dart';

import '../NavigationDrawers.dart';

class PeoPle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawers(),
      appBar: AppBar(
        title: Text('PeoPle'),
      ),
    );
  }
}
