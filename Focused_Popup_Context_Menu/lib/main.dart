import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Focused Popup Context Menu')),
      body: Center(
        child: FocusedMenuHolder(
          onPressed: () {},
          blurSize: 2,
          blurBackgroundColor: Colors.white12,

          /// decuration
          menuBoxDecoration: BoxDecoration(color: Colors.blue, boxShadow: [
            BoxShadow(color: Colors.red, blurRadius: 5, spreadRadius: 3)
          ]),

          /// height and width
          menuWidth: MediaQuery.of(context).size.width * .4,
          menuItemExtent: 50,

          /// animations
          animateMenuItems: true,
          duration: Duration(seconds: 1),
          menuItems: [
            FocusedMenuItem(
                title: Text('Save'),
                trailingIcon: Icon(Icons.save),
                backgroundColor: Colors.green,
                onPressed: () => print('you clicked ong Saved button')),
            FocusedMenuItem(
                title: Text('Rename'),
                onPressed: () => print('you clicked ong Rename button')),
            FocusedMenuItem(
                title: Text('Update'),
                onPressed: () => print('you clicked ong Update button')),
            FocusedMenuItem(
                title: Text('Delete'),
                onPressed: () => print('you clicked ong Delete button'))
          ],
          child: Container(height: 100, width: 100, color: Colors.blue),
        ),
      ),
    );
  }
}
