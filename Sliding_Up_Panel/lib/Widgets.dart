import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

Widget Images(BuildContext context, String url, double height) => Container(
      height: MediaQuery.of(context).size.width + height,
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );

Widget buildSlidingUpPanel({@required ScrollController scrollController}) =>
    ContantWidgets(
      scrollController: scrollController,
    );

class ContantWidgets extends StatelessWidget {
  const ContantWidgets({Key key, @required this.scrollController})
      : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.all(4),
        controller: scrollController,
        children: [
          Container(
            height: 8,
            margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: MediaQuery.of(context).size.width / 2.5),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.grey[400]),
                borderRadius: BorderRadius.circular(50),
                color: Colors.white),
          ),
          Text(
              'A draggable Flutter widget that makes implementing a SlidingUpPanel much easier! Based on the Material Design bottom sheet component, this widget works on both Android & iOS.',
              style: TextStyle(color: Colors.black, fontSize: 18)),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Images(
                  context,
                  'https://raw.githubusercontent.com/akshathjain/sliding_up_panel/master/screenshots/exampleclosed.png',
                  10)),
          Text(
              'This method is recommended as it allows for the least interference with the behavior of other UI elements.',
              style: TextStyle(color: Colors.black, fontSize: 18)),
          Text(
              'This method isn\'t recommended but can still be used. Only use '
              'this to avoid refactoring large chunks of code or to implement custom scrolling behavior. '
              'For example, the SlidingUpPanel can be nested inside of a Stack (note that there are'
              'many other possible implementations that vary on a case-by-case basis)',
              style: TextStyle(color: Colors.black, fontSize: 18)),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Images(
                  context,
                  'https://raw.githubusercontent.com/akshathjain/sliding_up_panel/master/screenshots/exampleopen.png',
                  10)),
        ],
      );
}
