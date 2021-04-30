import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final globarKey = GlobalKey<FormState>();
  String _email;
  int _phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Global Key')),
      body: Form(
          key: globarKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Mail', border: OutlineInputBorder()),
                    validator: (value) => value != null && !value.contains('@')
                        ? 'Not a valid Email'
                        : null,
                    onSaved: (value) => _email = value,
                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Phone number',
                          border: OutlineInputBorder()))),
              OutlinedButton(
                  child: Text('Check Validate'),
                  onPressed: () {
                    print('pressed');
                    print('>>>>>>$_email');
                    final form = globarKey.currentState;
                    if (form.validate()) {
                      print('validate');

                      /// for onSaved property. not usable for me
                      form.save();
                      print('>>>>>>$_email');
                    } else
                      print('validate failed');
                  })
            ],
          )),
    );
  }
}
