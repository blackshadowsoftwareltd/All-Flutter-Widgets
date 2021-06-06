import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: TabBars(),
    ));

class TabBars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.deepPurpleAccent,
          shadowColor: Colors.black,
          bottom: TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.black45,
            labelPadding: EdgeInsets.all(0),
            tabs: [
              Tab(
                icon: Icon(Icons.supervised_user_circle),
              ),
              Tab(
                icon: Icon(Icons.message),
              ),
              Tab(icon: Icon(Icons.mail)),
            ],
          ),
        ),
        body: TabBarView(
          children: [Users(), Message(), Mail()],
        ),
      ),
    );
  }
}

class Users extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
    );
  }
}

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
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
