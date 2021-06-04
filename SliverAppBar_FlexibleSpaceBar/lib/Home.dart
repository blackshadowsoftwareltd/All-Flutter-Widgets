import 'package:flutter/material.dart';
import 'package:sliver/AppBar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Sliver AppBar'),
            backgroundColor: Colors.green,
            expandedHeight: 500,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                  child: Image.asset('images/mount.png', fit: BoxFit.cover)),
            ),
          ),
          HeaderAppBar(title: 'This is a AppBar', color: Colors.green),
          SliverFixedExtentList(
            itemExtent: 100,
            delegate: SliverChildListDelegate([
        
    
              containers(Colors.deepOrange),
              containers(Colors.purple),
              containers(Colors.red),
              containers(Colors.black),          containers(Colors.blue),
              containers(Colors.grey),
              containers(Colors.green),
              containers(Colors.amber),
            ]),
          ),
        ],
      ),
    ));
  }

  Widget containers(Color color) =>
      Container(color: color, height: 100, width: double.infinity);
}
