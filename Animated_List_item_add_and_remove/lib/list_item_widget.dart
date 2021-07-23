import 'package:animated_list/list_items.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final ListItem item;
  final Animation<double> animation;
  final VoidCallback? onClickd;

  const ListItemWidget(
      {required this.item, required this.animation, required this.onClickd});

  @override
  Widget build(BuildContext context) {
    /// animation style 1
    return SizeTransition(

    ///// key for using image. key will be unique
    ///// key:ValueKey(item.imgList)
   
      sizeFactor: animation,
      child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green[100]),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [normalText(item.brand), normalText(item.model)]),
            IconButton(
                onPressed: onClickd,
                icon: Icon(Icons.delete, color: Colors.green[900]))
          ])),
    );

    /// animation style 2
    // return SlideTransition(
    //   position: Tween<Offset>(begin: Offset(1, -100), end: Offset.zero).animate(
    //       CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
    //   child: Container(
    //       margin: EdgeInsets.all(5),
    //       padding: EdgeInsets.all(10),
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10),
    //           color: Colors.green[100]),
    //       child:
    //           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //         Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [normalText(item.brand), normalText(item.model)]),
    //         IconButton(
    //             onPressed: onClickd,
    //             icon: Icon(Icons.delete, color: Colors.green[900]))
    //       ])),
    // );
  }

  ///
  normalText(label) => Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      child: Text(label,
          style: TextStyle(color: Colors.green[900], fontSize: 15)));
}
