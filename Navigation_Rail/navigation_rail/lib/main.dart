import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: _NavigationRail(),
      debugShowCheckedModeBanner: false,
    ));

class _NavigationRail extends StatefulWidget {
  @override
  _NavigationRailState createState() => _NavigationRailState();
}

class _NavigationRailState extends State<_NavigationRail> {
  int _selectedIndex = 0;
  final _pages = [Wifi(), Bluetooth(), GPS(), Location()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: Colors.grey[900],
            labelType: NavigationRailLabelType.all,
            elevation: 10,
            unselectedLabelTextStyle:
                TextStyle(fontSize: 15, color: Colors.grey[500]),
            selectedLabelTextStyle:
                TextStyle(fontSize: 18, color: Colors.white),
            destinations: [
              NavigationRailDestination(
                  icon: Icon(
                    Icons.wifi,
                    color: Colors.grey,
                  ),
                  label: Text(
                    'Wifi',
                    style: TextStyle(color: Colors.grey),
                  ),
                  selectedIcon: Icon(
                    Icons.wifi,
                    color: Colors.white,
                  )),
              NavigationRailDestination(
                  icon: Icon(
                    Icons.bluetooth,
                    color: Colors.grey,
                  ),
                  label:
                      Text('Bluetooth', style: TextStyle(color: Colors.grey)),
                  selectedIcon: Icon(
                    Icons.bluetooth,
                    color: Colors.white,
                  )),
              NavigationRailDestination(
                  icon: Icon(
                    Icons.gps_fixed,
                    color: Colors.grey,
                  ),
                  label: Text('GPS', style: TextStyle(color: Colors.grey)),
                  selectedIcon: Icon(
                    Icons.gps_fixed,
                    color: Colors.white,
                  )),
              NavigationRailDestination(
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.grey,
                  ),
                  label: Text('Location', style: TextStyle(color: Colors.grey)),
                  selectedIcon: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ))
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: (valu) {
              setState(() {
                _selectedIndex = valu;
              });
            },
          ),
          Expanded(
            child: Container(
              child: _pages[_selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}

class Wifi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}

class Bluetooth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}

class GPS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
    );
  }
}

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
    );
  }
}
