import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: _size.width,
              height: 80,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(_size.width, 80),
                    painter: CNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: .6,
                    child: FloatingActionButton(
                      backgroundColor: Colors.orange,
                      child: Icon(
                        Icons.shopping_cart,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    width: _size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.home,
                            size: 30,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.restaurant_menu,
                              size: 30,
                            ),
                            onPressed: () {}),
                        SizedBox(
                          width: _size.width * 0.2,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              size: 30,
                            ),
                            onPressed: () {}),
                        IconButton(
                            icon: Icon(
                              Icons.notifications_active,
                              size: 30,
                            ),
                            onPressed: () {}),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path _path = Path()..moveTo(0, 20);
    _path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    _path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    _path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(10), clockwise: false);
    _path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    _path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    _path.lineTo(size.width, size.height);
    _path.lineTo(0, size.height);
    _path.close();
    canvas.drawShadow(_path, Colors.black, 10, true);
    canvas.drawPath(_path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
