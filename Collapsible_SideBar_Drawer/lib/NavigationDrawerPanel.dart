import 'package:flutter/material.dart';

class NavigationDrawerPanel extends StatefulWidget {
  @override
  _NavigationDrawerPanelState createState() => _NavigationDrawerPanelState();
}

class _NavigationDrawerPanelState extends State<NavigationDrawerPanel> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isCollapsed ? MediaQuery.of(context).size.width * .2 : null,
      child: Drawer(
        child: Container(
            padding: EdgeInsets.all(5),
            color: Colors.blue,
            alignment: Alignment.bottomRight,
            child: collapsedButton()),
      ),
    );
  }

  Widget collapsedButton() => Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: () => setState(() => isCollapsed = !isCollapsed),
          child: isCollapsed
              ? Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )
              : Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                )));
}
