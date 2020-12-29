import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: SliverAppBarDemo()));

class SliverAppBarDemo extends StatefulWidget {
  @override
  _SliverAppBarDemoState createState() => _SliverAppBarDemoState();
}

class _SliverAppBarDemoState extends State<SliverAppBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            backgroundColor: Colors.green,
            pinned: true,
            shadowColor: Colors.black,
            elevation: 10,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Home'),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              _ListTile('Remon Ahammad', 'remonahammad@gmail.com'),
              _ListTile('Remon Ahammad', 'remonahammad@gmail.com'),
              _ListTile('Remon Ahammad', 'remonahammad@gmail.com'),
              _ListTile('Remon Ahammad', 'remonahammad@gmail.com'),
              _ListTile('Remon Ahammad', 'remonahammad@gmail.com'),
              _ListTile('Remon Ahammad', 'remonahammad@gmail.com'),
              _ListTile('Remon Ahammad', 'remonahammad@gmail.com'),
              _ListTile('Remon Ahammad', 'remonahammad@gmail.com'),
              _ListTile('Remon Ahammad', 'remonahammad@gmail.com'),
              _ListTile('Remon Ahammad', 'remonahammad@gmail.com'),
              _ListTile('Remon Ahammad', 'remonahammad@gmail.com'),
              _ListTile('Remon Ahammad', 'remonahammad@gmail.com'),
            ]),
          )
        ],
      ),
    );
  }
}

Widget _ListTile(String name, String mail) {
  return ListTile(
    leading: CircleAvatar(child: Text(name[0])),
    title: Text(name),
    subtitle: Text(mail),
  );
}
