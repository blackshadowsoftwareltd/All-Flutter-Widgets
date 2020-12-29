import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Custom Dialog',
      debugShowCheckedModeBanner: false,
      home: CustomAlartDialog(),
    ));

class CustomAlartDialog extends StatefulWidget {
  @override
  _CustomAlartDialogState createState() => _CustomAlartDialogState();
}

class _CustomAlartDialogState extends State<CustomAlartDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text(
            'Remon',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: Colors.green,
          padding: EdgeInsets.all(10),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: dialogBox(),
                  );
                });
          },
        ),
      ),
    );
  }

  Widget dialogBox() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey[900], borderRadius: BorderRadius.circular(20)),
        height: 300,
        // width: 150,
        child: Stack(
          alignment: Alignment.topCenter,
          overflow: Overflow.visible,
          children: [
            Positioned(
              top: -60,
              child: CircleAvatar(
                radius: 60,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(60),
                    ),
                    child: Image.asset('assets/remon.JPG')),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 70, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Remon Ahammad',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        letterSpacing: .5,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.white38,
                    thickness: 1,
                  ),
                  Text(
                    "Hi, I'm Remon Ahammad.\n I am a professional Android and IOS App Developer.\n I'm professionally developing Mobile applications.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                  Center(
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: RaisedButton(
                          color: Colors.grey[900],
                          elevation: 0,
                          highlightColor: Colors.grey[700],
                          child: Text(
                            'Ok',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
