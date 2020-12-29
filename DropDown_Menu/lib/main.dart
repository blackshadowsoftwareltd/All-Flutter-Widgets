import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Drop Down',
      home: Drop_Down_menu(),
    ));

class Drop_Down_menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Drop_Down_menuState();
  }
}

class _Drop_Down_menuState extends State<Drop_Down_menu> {
  var _items = [
    'Apple',
    'Orange',
    'Mango',
  ];
  var _selected = 'Fruits';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drop Down'),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _selected,
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            width: 20,
          ),
          DropdownButton<String>(
            hint: Text(
              _selected,
              style: TextStyle(fontSize: 20),
            ),
            elevation: 10,
            iconSize: 30,
            dropdownColor: Colors.grey[900],
            items: _items.map((String _item) {
              return DropdownMenuItem<String>(
                value: _item,
                child: Text(
                  _item,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              );
            }).toList(),
            onChanged: (String _selecte) {
              setState(() {
                _selected = _selecte;
              });
            },
          )
        ],
      )),
    );
  }
}
