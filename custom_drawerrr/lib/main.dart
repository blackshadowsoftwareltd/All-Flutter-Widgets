import 'package:flutter/material.dart';
import 'drawer.dart';

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
              fit: BoxFit.cover)),
      drawerScrimColor: Colors.transparent,
      drawer: const DrawerView(),
      onDrawerChanged: (value) {
        print(value);
      },
    );
  }
}
