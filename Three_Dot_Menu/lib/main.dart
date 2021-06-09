import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.white,
      title: Text('Three Dot Menu'),
      actions: [
        Theme(
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(color: Colors.grey[600]),
            dividerColor: Colors.red
        ),
          child: PopupMenuButton<int>(
            color: Colors.blue[50],
            onSelected: (item) => onSelectedItem(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Text('Settings'),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text('Share'),
              ),
              PopupMenuDivider(height: 10),
              PopupMenuItem<int>(
                value: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.blue,
                    ),
                    Text(
                      'Sign out',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }

  void onSelectedItem(context, int item) {
    switch (item) {
      case 0:
        print('Settings');
        break;
      case 1:
        print('Share');
        break;
      case 2:
        print('Sign Out');
        break;
    }
  }
}
