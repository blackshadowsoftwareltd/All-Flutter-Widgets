import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class TheirdPage extends StatefulWidget {
  @override
  _TheirdPageState createState() => _TheirdPageState();
}

class _TheirdPageState extends State<TheirdPage> {
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
      background: Colors.deepPurpleAccent,
      key: stateMenu,
      type: SideMenuType.shrikNRotate,
      menu: Container(child: Center(child: Text('SideMenuType.shrikNRotate'))),
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
        body: Center(child: Text('SideMenuType.shrikNRotate')),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        // floatingActionButton: FloatingActionButton(
        //     child: Icon(Icons.fingerprint, size: 35),
        //     onPressed: () =>
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => SecondPage()))),
      ),
    );
  }
}
