import 'package:flutter/material.dart';

class StackedWidgets extends StatelessWidget {
  final List<Widget> items;
  final double size;
  final TextDirection direction;

  const StackedWidgets(
      {Key key,
      @required this.items,
      @required this.size,
      this.direction = TextDirection.ltr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allItems = items
        .asMap()
        .map((index, item) {
          double _size = size -10;
          final value = Container(
              width: size,
              height: size,
              margin: EdgeInsets.only(left: _size * index),
              child: item);
          return MapEntry(index, value);
        })
        .values
        .toList();
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
            // color: Colors.blue,
            child: Stack(

                /// this condition can change stack left or right
                children: direction == TextDirection.ltr
                    ? allItems.reversed.toList()
                    : allItems)));
  }
}
