import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
            leading: Icon(Icons.menu),
            title: Text('TabBar'),
            actions: [Icon(Icons.search)],
            flexibleSpace: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1602966708529-01672465c83c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
                        fit: BoxFit.cover))),
            bottom: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white.withOpacity(.5),
                // isScrollable: true,
                indicatorWeight: 3,
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    icon: Icon(Icons.home),
                    text: 'Home',
                  ),
                  Tab(
                    icon: Icon(Icons.featured_play_list_outlined),
                    text: 'Feed',
                  ),
                  Tab(
                    icon: Icon(Icons.notifications),
                    text: 'Notification',
                  ),
                  Tab(
                    icon: Icon(Icons.verified_user),
                    text: 'Profile',
                  ),
                ])),
        body: TabBarView(children: [
          tabPage('Home'),
          tabPage('Feed'),
          tabPage('Notification'),
          tabPage('Profile')
        ]),
      ),
    );
  }

  Widget tabPage(String label) => Center(child: Text(label));
}
