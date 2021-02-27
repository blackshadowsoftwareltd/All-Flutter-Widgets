import 'package:Side_Drawer/ThierdPage.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final GlobalKey<SideMenuState> stateMenu = GlobalKey<SideMenuState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isOpen = false;
  }

  bool isOpen;

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      /// close Icon is null, because no need this
      closeIcon: null,

      /// Inverse
      inverse: false,
      background: Colors.green,
      key: stateMenu,
      type: SideMenuType.slide,
      menu: Container(child: Center(child: Text('SideMenuType.slide'))),
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
          icon: isOpen ? Icon(Icons.arrow_back_ios) : Icon(Icons.menu),
          onPressed: () => setState(() {
            if (isOpen == false) {
              final _state = stateMenu.currentState;
              _state.openSideMenu();
              isOpen = true;
            } else {
              final _state = stateMenu.currentState;
              _state.closeSideMenu();
              isOpen = false;
            }
          }),
        )),
        body: Center(child: Text('SideMenuType.slide')),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.fingerprint, size: 35),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => TheirdPage()))),
      ),
    );
  }
}
