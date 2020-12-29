import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Bottom Sheet Demo',
      home: BottomSheetDemo(),
    ));

class BottomSheetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomSheetDemoState();
  }
}

class BottomSheetDemoState extends State<BottomSheetDemo> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: RaisedButton(
          padding: EdgeInsets.all(5),
          color: Colors.green,
          elevation: 5,
          focusElevation: 15,
          child: Text(
            'Action',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return _bottomSheet();
                });
          },
        ),
      ),
    );
  }

  Widget _bottomSheet() {
    return Container(
      color: Colors.grey[900],
      height: 200,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Bottom Sheet',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            title: Text(
              'Get Action',
              style: TextStyle(color: Colors.white),
            ),
            subtitle:
                Text('Click here!', style: TextStyle(color: Colors.white)),
            focusColor: Colors.orange,
            hoverColor: Colors.amber,
            trailing: Icon(
              Icons.call_missed_outgoing,
              color: Colors.white,
              size: 25,
            ),
            onTap: () {
              print('Get Action is clicked');
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('Yes',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                color: Colors.grey[900],
                elevation: 0,
                highlightElevation: 0,
                onPressed: () {},
              ),
              SizedBox(
                width: 20,
              ),
              RaisedButton(
                child: Text('No',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                elevation: 0,
                highlightElevation: 0,
                color: Colors.grey[900],
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
