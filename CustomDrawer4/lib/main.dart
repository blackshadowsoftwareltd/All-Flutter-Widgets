import 'package:cust/drawer.dart';
import 'package:cust/homePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double xOffset;

  double yOffset;

  double scaleFactor;
  bool isDrawerOpen = false;
bool isDragging=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [_drawer(), _home()],
      ),
    );
  }

  Widget _drawer() => DrawerPage();

  Widget _home() {
    return AnimatedContainer(
        duration: Duration(seconds: 1),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        child: ClipRRect(
            borderRadius:
                BorderRadius.all(Radius.circular(isDrawerOpen ? 20 : 0)),
            child: Container(
                child: HomePage(
                    openDrawer: isDrawerOpen ? closeDrawer : openDrawer))));
  }

  void openDrawer() => setState(() {
        xOffset = 230;
        yOffset = 150;
        scaleFactor = .7;
        isDrawerOpen = true;
      });

  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });
}
