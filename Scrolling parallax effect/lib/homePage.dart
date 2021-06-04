import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double offset = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('scrolling parallax effect'),
      // ),
      body: NotificationListener<ScrollNotification>(
        onNotification: updateScroll,
        child: Stack(
          children: [
            /// this container placed on tha background
            /// /// (-) that means container going to top when value is increass
            Positioned(
              top: -.25 * offset,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Image.network(url, fit: BoxFit.cover),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 400),
                  containers(Colors.orange),
                  Container(
                      height: 100,
                      color: Colors.transparent,
                      width: double.infinity),
                  containers(Colors.purple),
                  containers(Colors.deepOrange),
                  containers(Colors.blue),
                  containers(Colors.red),
                  containers(Colors.orange),
                  containers(Colors.purple),
                  containers(Colors.deepOrange),
                  containers(Colors.red),
                  containers(Colors.green)
                ],
              ),
            ),

            /// this container placed on forground as a app bar
            // imgContainer()
          ],
        ),
      ),
    );
  }

  bool updateScroll(ScrollNotification notification) {
    setState(() => offset = notification.metrics.pixels);
    return true;
  }

  Widget imgContainer() => Container(
        width: MediaQuery.of(context).size.width,
        height: offset < 300 ? 400 - offset : 100,
        child: Image.network(url, fit: BoxFit.cover),
      );
  Widget containers(Color color) =>
      Container(color: color, width: double.infinity, height: 100);
}

const url =
    'https://images.unsplash.com/photo-1615859131861-052f0641a60e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1411&q=80';
