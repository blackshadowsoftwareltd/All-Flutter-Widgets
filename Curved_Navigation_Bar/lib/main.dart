import 'package:Curved_Navigation_Bar/all_pages/contactUs_page.dart';
import 'package:Curved_Navigation_Bar/all_pages/share_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'all_pages/home_page.dart';
import 'all_pages/notification_page.dart';

void main() => runApp(MaterialApp(
      title: 'CurveNavBar',
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    ));

class BottomNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomNavBarState();
  }
}

class BottomNavBarState extends State<BottomNavBar> {
  var _page = 0;
  final pages = [Home(), Notifications(), ContactUs(), Share()];
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        color: Colors.black87,
        buttonBackgroundColor: Colors.black87,
        backgroundColor: Colors.white24,
        animationCurve: Curves.slowMiddle,
        animationDuration: Duration(milliseconds: 500),
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          Icon(
            Icons.contacts,
            color: Colors.white,
          ),
          Icon(
            Icons.share,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: pages[_page],
    );
  }
}
