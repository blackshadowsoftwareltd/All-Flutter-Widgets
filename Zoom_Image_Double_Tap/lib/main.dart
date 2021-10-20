import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  ///
  late AnimationController animationController;
  Animation<Matrix4>? animation;

  ///
  late TransformationController transformationController;
  TapDownDetails? tapDownDetails;

  ///
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addListener(() {
            transformationController.value = animation!.value;
          });

    ///
    transformationController = TransformationController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
    transformationController.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(), body: Center(child: doubleTapToZoomImage()));

  ///
  Widget doubleTapToZoomImage() => GestureDetector(

      ///
      onDoubleTapDown: (details) => tapDownDetails = details,
      onDoubleTap: () {
        ///
        final double scale = 3; // 3x zoom
        final position = tapDownDetails!.localPosition;
        final x = -position.dx * (scale - 1);
        final y = -position.dy * (scale - 1);

        ///

        final zoomed = Matrix4.identity()
          ..translate(x, y)
          ..scale(scale);
        final end = transformationController.value.isIdentity()
            ? zoomed
            : Matrix4.identity();
        // transformationController.value = value; // without animation

        /// animation
        animation = Matrix4Tween(
                begin: transformationController.value, end: end)
            .animate(
                CurveTween(curve: Curves.easeOut).animate(animationController));
        animationController.forward(from: 0);
      },
      child: InteractiveViewer(

          /// must need
          transformationController: transformationController,

          /// it will make image out of the default container size
          // clipBehavior: Clip.none,
          clipBehavior: Clip.none,
          panEnabled: false,
          scaleEnabled: false,

          ///
          child: Image.network(
              'https://images.unsplash.com/photo-1433086966358-54859d0ed716?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80',
              fit: BoxFit.cover)));
}
