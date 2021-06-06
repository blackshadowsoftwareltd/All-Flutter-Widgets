import 'package:flutter/material.dart';

import 'NavigationDrawerPanel.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:Text('Collapsible_SideBar_Drawer')),drawer: NavigationDrawerPanel(),);
  }
}
