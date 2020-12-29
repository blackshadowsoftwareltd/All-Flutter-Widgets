import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var _key = GlobalKey<FormState>();
  String _nameData;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextForm Validation'),
      ),
      body: Form(
        key: _key,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  keyboardType: TextInputType.name,
                  onChanged: (String _data) {
                    _nameData = _data.toLowerCase();
                  },
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please Enter Test';
                    } else if (value.length < 5) {
                      return 'Enter minimum 5 charecters';
                    }
                  },
                )),
            FlatButton(
              padding: EdgeInsets.all(5),
              child: Text(
                'Test Validation',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                print(_nameData);
                setState(() {
                  _key.currentState.validate();
                });
              },
            )
          ]),
        ),
      ),
    );
  }
}
