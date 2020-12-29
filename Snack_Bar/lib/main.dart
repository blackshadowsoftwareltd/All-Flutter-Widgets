import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'SnackBar',
      home: MySnackBar(),
    ));

class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: RaisedButton(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              elevation: 0,
              child: Text(
                'Action',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              onPressed: () {
                final _snackBar = SnackBar(
                  backgroundColor: Colors.grey[900],
                  content: Text(
                    'Thsis is a SnackBar',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  action: SnackBarAction(
                    label: 'Undo',
                    textColor: Colors.green,
                    onPressed: () {},
                  ),
                );
                Scaffold.of(context).showSnackBar(_snackBar);
              },
            ),
          )),
    );
  }
}
