import 'package:flutter/material.dart';

import 'user_image.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String imageUrl = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: UserImage(
              onFileChanged: (imageUrl) =>
                  setState(() => this.imageUrl = imageUrl),
            ),
          )
        ],
      ),

    );
  }
}
