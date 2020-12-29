import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: __Drawer(),
      debugShowCheckedModeBanner: false,
    ));

class __Drawer extends StatefulWidget {
  State<StatefulWidget> createState() => __DrawerState();
}

class __DrawerState extends State<__Drawer> {
  final _glovalKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(
      key: _glovalKey,
      appBar: AppBar(
        title: Text('Drawer'),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_right,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            _glovalKey.currentState.openDrawer();
          },
        ),
      ),
      drawer: Drawer(elevation: 10, child: _drawerProperty()),
      endDrawer: Drawer(elevation: 10, child: _drawerProperty()),
    );
  }

  Widget _drawerProperty() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
            Colors.green,
            Colors.green[300],
            Colors.green
          ])),
          child: Container(
            child: Column(
              children: [
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.green[600],
                  child: Padding(
                    padding: EdgeInsets.all(3),
                    child: CircleAvatar(
                      maxRadius: 45,
                      backgroundImage: AssetImage('assets/remon.JPG'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Remon Ahammad',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
        _CustomListTile(Icons.home, 'Home', () {
          _home(Icons.home);
        }),
        _CustomListTile(Icons.person, 'Person', () {
          _home(Icons.person);
        }),
        _CustomListTile(Icons.notifications, 'Notifications', () {
          _home(Icons.notifications);
        }),
        _CustomListTile(Icons.settings, 'Settings', () {
          _home(Icons.settings);
        }),
      ],
    );
  }

  void _home(IconData _icon) {
    if (_icon == Icons.home) {
      return print('Home');
    } else if (_icon == Icons.person) {
      return print('Person');
    } else if (_icon == Icons.notifications) {
      return print('Notifications');
    } else if (_icon == Icons.settings) {
      return print('Settings');
    }
  }
}

class _CustomListTile extends StatelessWidget {
  IconData icon;
  String txt;
  Function onTap;
  _CustomListTile(this.icon, this.txt, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: InkWell(
        splashColor: Colors.green,
        child: Container(
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: Colors.grey[700], width: .2),
          )),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      icon,
                      size: 25,
                      color: Colors.grey[700],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      txt,
                      style: TextStyle(
                          fontSize: 18,
                          letterSpacing: .5,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[700]),
                    ),
                  )
                ],
              ),
              Icon(
                Icons.chevron_right,
                size: 25,
                color: Colors.grey[700],
              )
            ],
          ),
        ),
        onTap: () {
          onTap();
        },
      ),
    );
  }
}
