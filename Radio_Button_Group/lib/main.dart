import 'package:Radio_Button_Group/SecondPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: SecondPage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _bulbColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grouped Radio Button')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 5),
            Icon(
              Icons.lightbulb_outline,
              color: _bulbColor,
              size: 100,
            ),
            Spacer(flex: 1),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Radio(
                      value: Colors.red,
                      groupValue: _bulbColor,
                      onChanged: (value) {
                        _bulbColor = value;
                        setState(() {});
                      }),
                  Text('Red', style: TextStyle(color: Colors.red))
                ]),
            Spacer(flex: 1),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Radio(
                      value: Colors.green,
                      groupValue: _bulbColor,
                      onChanged: (value) {
                        _bulbColor = value;
                        setState(() {});
                      }),
                  Text('Green', style: TextStyle(color: Colors.green))
                ]),
            Spacer(flex: 1),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Radio(
                      value: Colors.blue,
                      groupValue: _bulbColor,
                      onChanged: (value) {
                        _bulbColor = value;
                        setState(() {});
                      }),
                  Text('Blue', style: TextStyle(color: Colors.blue))
                ]),
            Spacer(
              flex: 5,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_right_alt_outlined),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SecondPage())),
      ),
    );
  }
}
