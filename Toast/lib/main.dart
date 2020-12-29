import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MaterialApp(
      title: 'Toast',
      home: MyToast(),
    ));

class MyToast extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toast'),
      ),
      body: Center(
        child: RaisedButton(
          padding: EdgeInsets.all(10),
          color: Colors.green,
          child: Text('Acion'),
          onPressed: () {
            Fluttertoast.showToast(
                msg: 'This is a Toast',
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 20,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM);
          },
        ),
      ),
    );
  }
}
