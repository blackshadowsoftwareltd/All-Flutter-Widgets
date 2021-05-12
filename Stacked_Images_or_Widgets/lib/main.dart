import 'package:flutter/material.dart';
import 'Resource.dart';
import 'StackedWidgets.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  final double size = 50;
  final List<String> imagesList = urlImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stacked Images List or Widget')),
      body: Center(child: StackedImages()),
    );
  }

  Widget StackedImages() {
    final items = urlImage.map((img) => Images(img)).toList();

    return StackedWidgets(items: items, size: size);
  }

  Widget Images(String img) => ClipOval(
        child: Container(
            padding: EdgeInsets.all(3),
            color: Colors.black,
            child: ClipOval(child: Image.network(img, fit: BoxFit.cover))),
      );
}
