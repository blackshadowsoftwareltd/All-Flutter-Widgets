import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.network(
            'https://images.unsplash.com/photo-1653572656708-7a5f7e2c36a1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=724&q=80',
            fit: BoxFit.cover),
      ),
      drawerScrimColor: Colors.transparent,
      drawer: TweenAnimationBuilder(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOutCirc,
          tween: Tween<double>(begin: 0, end: 5),
          onEnd: () {
            print('end');
          },
          builder: (_, double value, __) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: value, sigmaY: value),
              child: Container(
                color: Colors.white,
                width: 200,
                alignment: Alignment.center,
                child: const Text('Remon'),
              ),
            );
          }),
      onDrawerChanged: (value) {
        print(value);
      },
    );
  }
}
