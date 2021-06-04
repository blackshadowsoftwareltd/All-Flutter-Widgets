import 'package:flutter/material.dart';

class HeaderAppBar extends StatelessWidget {
  final String title;
  final Color color;

  const HeaderAppBar({Key key, this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: Delegatez(title: title, color: color),
    );
  }
}

class Delegatez extends SliverPersistentHeaderDelegate {
  final String title;
  final Color color;

  Delegatez({this.title, this.color});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        color: color);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 120;

  @override
  // TODO: implement minExtent
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}
