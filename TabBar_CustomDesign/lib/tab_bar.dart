import 'package:flutter/material.dart';

class TabBars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container( 
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TabBar(
        labelColor: Colors.blue[900],
        unselectedLabelColor: Colors.blue[700],
        labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        unselectedLabelStyle:
            TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        labelPadding: EdgeInsets.symmetric(vertical: 5),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
            color: Colors.grey.withOpacity(.3),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        tabs: [Text('Green'), Text('Oragne')],
      ),
    );
  }
}
