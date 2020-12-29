import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Dismissable',
      home: MyDismissibleWidget(),
    ));

class MyDismissibleWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyDismissibleWidgetState();
  }
}

class MyDismissibleWidgetState extends State<MyDismissibleWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismissable Widget'),
      ),
      body: Center(
          child: Dismissible(
        key: ValueKey('abe'),
        direction: DismissDirection.horizontal,
        background: Container(
          color: Colors.blue,
          child: Icon(
            Icons.delete,
            size: 25,
            color: Colors.white,
          ),
        ),
        secondaryBackground: Container(
          color: Colors.green,
          child: Icon(
            Icons.add,
            size: 25,
            color: Colors.white,
          ),
        ),
        child: ListTile(
          title: Text('Remon Ahammad'),
          subtitle: Text('remonahammad@gmail.com'),
          trailing: Icon(
            Icons.person_pin,
            size: 30,
          ),
        ),
      )),
    );
  }
}
