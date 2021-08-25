import 'package:flutter/material.dart';

class ListOfDatas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => _card(),
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: 20);
  }
}

class SliverListOfDatas extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      final childCount = 30;
      final hasSeparator = index != childCount - 1;
      final double bottom = hasSeparator ? 12 : 0;
      final child = _card();
      return Container(margin: EdgeInsets.only(bottom: 20), child: child);
    }, childCount: 30));
  }
}

Widget _card() => Container(
    margin: EdgeInsets.all(5),
    height: 40,
    width: double.infinity,
    color: Colors.grey.shade300);
