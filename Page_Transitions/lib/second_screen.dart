import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text('Second Screen'),
          backgroundColor: Colors.lightBlue,
        ),
        body: const Center(
            child: Text('Second Screen', style: TextStyle(fontSize: 25))));
  }
}
