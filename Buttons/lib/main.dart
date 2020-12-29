import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Button's",
      debugShowCheckedModeBanner: false,
      home: Buttons(),
    ));

class Buttons extends StatefulWidget {
  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              padding: EdgeInsets.all(20),
              child: Text(
                'Raised Button',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {},
            ),
            Divider(
              color: Colors.black,
              height: 0,
              thickness: 1,
            ),
            Container(
              height: 50,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                      child: FlatButton(
                    child: Text(
                      'Flat',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                  )),
                  Expanded(
                      child: FlatButton(
                    child: Text(
                      'Button',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                  ))
                ],
              ),
            ),
            Divider(
              color: Colors.black,
              height: 0,
              thickness: 1,
            ),
            Container(
              height: 70,
              color: Colors.grey[900],
              child: Row(
                children: [
                  Expanded(
                      child: FlatButton(
                    padding: EdgeInsets.all(20),
                    highlightColor: Colors.black,
                    splashColor: Colors.grey[700],
                    child: Text(
                      'Flat',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {},
                  )),
                  Expanded(
                      child: FlatButton(
                    padding: EdgeInsets.all(20),
                    highlightColor: Colors.black,
                    splashColor: Colors.grey[700],
                    child: Text(
                      'Button',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {},
                  ))
                ],
              ),
            ),
            Divider(
              color: Colors.black,
              height: 0,
              thickness: 1,
            ),
            //Floating Action Button inside body proparty:
            Padding(
              padding: EdgeInsets.all(10),
              child: FloatingActionButton(
                backgroundColor: Colors.green,
                elevation: 10,
                highlightElevation: 20,
                tooltip: 'Floating ActionButton inside body property',
                splashColor: Colors.black,
                child: Icon(
                  Icons.home,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ),
            IconButton(
              color: Colors.green,
              alignment: Alignment.center,
              highlightColor: Colors.grey[700],
              splashColor: Colors.green,
              hoverColor: Colors.green[600],
              icon: Icon(
                Icons.camera,
                size: 30,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
      //Floating Action Button inside Scaffold Widget
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(0),
        child: FloatingActionButton(
          elevation: 10,
          highlightElevation: 20,
          splashColor: Colors.black,
          tooltip: 'Floating ActionButton inside Scaffold Widget',
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
