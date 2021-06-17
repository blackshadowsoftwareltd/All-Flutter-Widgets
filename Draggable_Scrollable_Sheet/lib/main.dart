import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Draggable Scrollable Sheet')),
        body: Stack(fit: StackFit.expand, children: [
          Container(
              height: double.infinity,
              child: Image.asset('images/sky.png', fit: BoxFit.cover)),
          DraggableScrollableSheet(
              initialChildSize: .2,
              minChildSize: .1,
              maxChildSize: .8,
              builder: (context, controller) => ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.white60,
                        child: SingleChildScrollView(
                            controller: controller,
                            child: Column(children: [
                              tiles(Colors.green.withOpacity(.5)),
                              tiles(Colors.orange.withOpacity(.5)),
                              tiles(Colors.blue.withOpacity(.5)),
                              tiles(Colors.red.withOpacity(.5)),
                              tiles(Colors.green.withOpacity(.5)),
                              tiles(Colors.orange.withOpacity(.5)),
                              tiles(Colors.blue.withOpacity(.5)),
                              tiles(Colors.red.withOpacity(.5))
                            ]))),
                  ))
        ]));
  }

  Widget tiles(Color color) => Container(
      margin: EdgeInsets.all(5),
      height: 100,
      color: color,
      width: double.infinity);
}
