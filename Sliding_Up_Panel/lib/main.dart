import 'package:flutter/material.dart';
import 'Widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// panel controller
  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliding Up Panel')),
      body: GestureDetector(
        onTap: () => panelController.open(),
        child: Container(
          child: SlidingUpPanel(

              /// minimum limit of content height
              minHeight: 100,

              /// maximum limit of content height
              maxHeight: 500,

              /// panel controller for open the content when user press on this
              controller: panelController,
              panelBuilder: (scrollController) =>
                  buildSlidingUpPanel(scrollController: scrollController),
              body: Images(
                  context,
                  'https://images.pexels.com/photos/1671325/pexels-photo-1671325.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
                  100)),
        ),
      ),
    );
  }
}
