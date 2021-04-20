import 'package:Side_Drawer/SecondPage.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// key
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
      radius:BorderRadius.all(Radius.circular(20)),
      background: Colors.deepOrange,
      key: stateMenu,
      type: SideMenuType.shrinkNSlide,
      menu: Center(child: Text('SideMenuType.shrinkNSlide')),
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
                    })),
            title: Text('Side Menu')),
        body: Container(child: Text('SideMenuType.shrinkNSlide')),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.fingerprint, size: 35),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SecondPage()))),
      ),
    );
  }
}
