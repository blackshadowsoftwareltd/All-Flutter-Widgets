import 'package:StateManegementPart2/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Data()),
        ],
        child: MaterialApp(
          home: HomePage(),
        ),
      ),
    );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final providerdata = Provider.of<Data>(context);
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text(providerdata.value.toString()),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          providerdata.increment();
        },
      ),
    );
  }
}
