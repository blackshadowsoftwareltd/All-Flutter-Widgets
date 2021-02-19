import 'package:Check_Box/notification_settings.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool value = false, isRed = false, isGreen = false, isBlue = false;
  final allowNotifications = NotificationSettings(title: 'Active notification');
  final notifications = [
    NotificationSettings(title: 'Show Message'),
    NotificationSettings(title: 'Show Notification'),
    NotificationSettings(title: 'Show Call')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check Box')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            buildCheckBox(),
            Divider(color: Colors.black, height: 10),
            Divider(color: Colors.black, height: 10),
            buildGroupCheckBox(),
            Divider(color: Colors.black, height: 10),
            Divider(height: 10, color: Colors.black),
            activeChackBox(allowNotifications),
            Divider(height: 5, color: Colors.black),
            ...notifications.map(lastCheckBox).toList(),
          ],
        ),
      ),
    );
  }

  Widget buildCheckBox() => Checkbox(
      value: value,
      onChanged: (value) {
        this.value = value;
        setState(() {
          print(value);
        });
      });

  Widget buildGroupCheckBox() => Column(
        children: [
          ListTile(
              leading: Checkbox(
                  value: isRed,
                  onChanged: (isRed) {
                    this.isRed = isRed;
                    setState(() {
                      print('isRed ? $isRed');
                    });
                  }),
              title: Text('Red'),
              onTap: () {
                setState(() {
                  this.isRed = !isRed;
                  print('isRed ? $isRed');
                });
              }),
          ListTile(
              leading: Checkbox(
                  value: isGreen,
                  onChanged: (isGreen) {
                    this.isGreen = isGreen;
                    setState(() {
                      print('isGreen ? $isGreen');
                    });
                  }),
              title: Text('Green'),
              onTap: () {
                this.isGreen = !isGreen;
                setState(() {
                  print('isGreen ? $isGreen');
                });
              }),
          ListTile(
            leading: Checkbox(
                value: isBlue,
                onChanged: (isBlue) {
                  this.isBlue = isBlue;
                  setState(() {
                    print('isBlue ? $isBlue');
                  });
                }),
            title: Text('Blue'),
            onTap: () {
              this.isBlue = !isBlue;
              setState(() {
                print('isBlue ? $isBlue');
              });
            },
          )
        ],
      );
  Widget activeChackBox(NotificationSettings notification) => _groupCheckBox(
      notification: notification,
      onClicked: () {
        final newValue = !notification.value;
        setState(() {
          allowNotifications.value = newValue;
          notifications.forEach((notification) {
            notification.value = newValue;
          });
        });
      });
  Widget lastCheckBox(NotificationSettings notification) => _groupCheckBox(
      notification: notification,
      onClicked: () {
        setState(() {
          final newValue = !notification.value;
          notification.value = newValue;
          print('Title: ${notification.title}\nValue:${notification.value}');
          if (!newValue)
            allowNotifications.value = false;
          else {
            final allow =
                notifications.every((notification) => notification.value);
            allowNotifications.value = allow;
          }
        });
      });
  Widget _groupCheckBox(
          {@required NotificationSettings notification,
          @required VoidCallback onClicked}) =>
      ListTile(
        leading: Checkbox(
            value: notification.value, onChanged: (value) => onClicked),
        title: Text('${notification.title}'),
        onTap: onClicked,
      );
}
