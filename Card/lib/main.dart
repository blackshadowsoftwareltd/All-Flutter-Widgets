import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: _Card(),
    ));

class _Card extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card'),
      ),
      body: Column(
        children: [_card()],
      ),
    );
  }

  Widget _card() {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.all(5),
                child: Image.asset("assets/remon.jpg")),
            Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Remon Ahammad',
                  style: TextStyle(fontSize: 20),
                )),
            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('nextr71@gmail.com'),
                    Positioned(right: 10, child: Icon(Icons.person))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
