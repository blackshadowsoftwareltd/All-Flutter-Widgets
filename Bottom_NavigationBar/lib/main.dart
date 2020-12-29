import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: BottomNavBar(),
      title: 'Bottom Nav Bar',
    ));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _currentIndex = 0;
  final pages = [Home(), Notifications(), Mail(), Contact()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.grey,
        selectedFontSize: 18,
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(color: Colors.black54),
        unselectedFontSize: 15,
        unselectedItemColor: Colors.black45,
        showUnselectedLabels: true,
        elevation: 10,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), title: Text('Notifications')),
          BottomNavigationBarItem(icon: Icon(Icons.mail), title: Text('Mail')),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), title: Text('Contact'))
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: pages[_currentIndex],
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class Mail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
    );
  }
}
