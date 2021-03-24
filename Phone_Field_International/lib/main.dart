import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var numbers;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IntlPhoneField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    labelText: 'Contact Number',
                    hintText: 'Enter a valid Number',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 5),
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
                onChanged: (value) {
                  /// input data type will be String
                  numbers = value.completeNumber;
                  print('Country code${value.countryCode}');
                  print('value : $value');
                  print('CompleteNumber : $numbers');
                }),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.deepOrange, width: 3)),
                child: IntlPhoneField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Contact Number',
                      hintText: 'Enter a valid Number',
                    ),
                    onChanged: (value) {
                      /// input data type will be String
                      numbers = value.completeNumber;
                      print('Country code${value.countryCode}');
                      print('value : $value');
                      print('CompleteNumber : $numbers');
                    })),
          ],
        ),
      ),
    );
  }
}
