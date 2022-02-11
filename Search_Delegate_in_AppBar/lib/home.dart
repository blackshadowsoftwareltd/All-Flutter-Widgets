import 'package:flutter/material.dart';

import 'searching.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
        actions: [
          IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: SearchingDelegate()),
              icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}
