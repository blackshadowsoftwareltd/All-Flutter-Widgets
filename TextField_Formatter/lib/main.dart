import 'package:flutter/material.dart';
import 'package:pattern_formatter/date_formatter.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextField Formatter')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Spacer(flex: 1),
            Text('Thousands Formatter',style: TextStyle(fontSize: 20)),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(hintText: 'Input Value'),
                style: TextStyle(color: Colors.grey),
                inputFormatters: [ThousandsFormatter()],
                keyboardType: TextInputType.number,
              ),
            ),
            Spacer(flex: 1),
            Text('CreditCard Formatter',style: TextStyle(fontSize: 20)),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(hintText: 'Input Value'),
                style: TextStyle(color: Colors.grey),
                inputFormatters: [CreditCardFormatter()],
                keyboardType: TextInputType.number,
              ),
            ),
            Spacer(flex: 1),
            Text('Date Input Formatter',style: TextStyle(fontSize: 20)),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(hintText: 'Input Value'),
                style: TextStyle(color: Colors.grey),
                inputFormatters: [DateInputFormatter()],
                keyboardType: TextInputType.number,
              ),
            ),Spacer(flex: 1)
            
          ],
        ),
      ),
    );
  }
}
