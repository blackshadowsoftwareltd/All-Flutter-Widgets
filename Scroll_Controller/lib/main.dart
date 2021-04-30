import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scrollController = ScrollController();
  bool isTop = true, isDown = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Scroll Controller')),
      body: Container(
        child: ListView.builder(
            itemCount: model.length,
            controller: scrollController,
            itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(10),
                  child: Text('${model[index]}'),
                )),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: 
     FloatingActionButton(
              child: isDown
                  ? Icon(Icons.arrow_upward_rounded)
                  : isTop
                      ? Icon(Icons.arrow_downward)
                      : Icon(Icons.face),
              onPressed: () {
                controlls();
              })
,
    );
  }


/// this method for, if position is up or not down 
  void controlls() {
    if (scrollController.position.atEdge) {
      isTop = scrollController.position.pixels == 0;
      isDown = scrollController.position.pixels ==
          scrollController.position.maxScrollExtent;
      if (isTop == true) {
        scrollDown();
      } else if (isDown == true) {
        scrollUp();
      } else {
        isTop = false;
        isDown = false;
        print('not scrolleble');
      }
      setState(() {});
    }
  }

  void scrollUp() {
    print('pressed');
    final double position = 0;

    /// method 1
    // scrollController.jumpTo(position);
    /// method 2
    scrollController.animateTo(position,
        duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  void scrollDown() {
    print('pressed');
    final double position = scrollController.position.maxScrollExtent;

    /// method 1
    // scrollController.jumpTo(position);
    /// method 2
    scrollController.animateTo(position,
        duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  final model = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40
  ];
}
