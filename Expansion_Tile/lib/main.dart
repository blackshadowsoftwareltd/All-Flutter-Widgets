import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(title: 'ExpansionTile', home: _ExpansionTile()));

class _ExpansionTile extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _ExpansionTileState();
  }
}

class _ExpansionTileState extends State<_ExpansionTile> {
  bool _state = true;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion Tile'),
      ),
      body: Column(
        children: [
          ListView(
            children: [
              ExpansionTile(
                childrenPadding: EdgeInsets.all(10),
                title: Text('Remon Ahammad'),
                subtitle: Text('remonahammad@agmail.com'),
                leading: Icon(Icons.person),
                trailing: IconButton(
                  icon: _state == true
                      ? Icon(Icons.arrow_downward)
                      : Icon(Icons.arrow_upward),
                  onPressed: () {
                    setState(() {
                      _state = !_state;
                    });
                  },
                ),
                children: [
                  Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.home)),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.camera)),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.image)),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.directions_walk))
                      ],
                    ),
                  )
                ],
              ),
              ExpansionTile(
                childrenPadding: EdgeInsets.all(10),
                backgroundColor: Colors.grey[300],
                title: Text('Remon Ahammad'),
                subtitle: Text('remonahammad@agmail.com'),
                leading: Icon(Icons.person),
                trailing: IconButton(
                  icon: _state == true
                      ? Icon(Icons.arrow_downward)
                      : Icon(Icons.arrow_upward),
                  onPressed: () {
                    setState(() {
                      _state = !_state;
                    });
                  },
                ),
                children: [
                  Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.home)),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.camera)),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.image)),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.directions_walk))
                      ],
                    ),
                  )
                ],
              ),
              ExpansionTile(
                childrenPadding: EdgeInsets.all(10),
                backgroundColor: Colors.grey[300],
                title: Text('Remon Ahammad'),
                subtitle: Text('remonahammad@agmail.com'),
                leading: Icon(Icons.person),
                trailing: IconButton(
                  icon: _state == true
                      ? Icon(Icons.arrow_downward)
                      : Icon(Icons.arrow_upward),
                  onPressed: () {
                    setState(() {
                      _state = !_state;
                    });
                  },
                ),
                children: [
                  Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.home)),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.camera)),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.image)),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.directions_walk))
                      ],
                    ),
                  )
                ],
              ),
              ExpansionTile(
                childrenPadding: EdgeInsets.all(10),
                backgroundColor: Colors.grey[300],
                title: Text('Remon Ahammad'),
                subtitle: Text('remonahammad@agmail.com'),
                leading: Icon(Icons.person),
                trailing: IconButton(
                  icon: _state == true
                      ? Icon(Icons.arrow_downward)
                      : Icon(Icons.arrow_upward),
                  onPressed: () {
                    setState(() {
                      _state = !_state;
                    });
                  },
                ),
                children: [
                  Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.home)),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.camera)),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.image)),
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.directions_walk))
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
