import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'example_package.dart';
import 'simple.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expandable Widget')),
      body: Center(
        child: SizedBox(
          height: 100,
          child: Column(
            children: [
              OutlinedButton(
                  onPressed: () => Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => Simple())),
                  child: const Text('Simple Example')),
              OutlinedButton(
                  onPressed: () => Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => MyHomePage())),
                  child: const Text('Example from package'))
            ],
          ),
        ),
      ),
    );
  }
}
