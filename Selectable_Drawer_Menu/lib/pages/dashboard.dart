import 'package:flutter/material.dart';
import 'package:select/NavigationDrawers.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: NavigationDrawers(),
      appBar: AppBar(
        title: Text('DashBoard'),
      ),
    );
  }
}
