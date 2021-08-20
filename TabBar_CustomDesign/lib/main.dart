import 'package:flutter/material.dart';
import 'package:tabbarcustom/tab_bar.dart';
import 'package:tabbarcustom/tabs.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Custom TabBar',
            style: TextStyle(color: Colors.blue),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: TabBars(),
          ),
        ),
        body: TabBarView(
          children: [GreenTab(), OrangeTab()],
        ),
      ),
    );
  }
}
