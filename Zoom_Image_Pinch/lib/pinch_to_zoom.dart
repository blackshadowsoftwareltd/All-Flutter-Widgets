import 'package:flutter/material.dart';

class PinchToZoomImage extends StatefulWidget {
  const PinchToZoomImage({Key? key}) : super(key: key);

  @override
  State<PinchToZoomImage> createState() => _PinchToZoomImageState();
}

class _PinchToZoomImageState extends State<PinchToZoomImage>
    with SingleTickerProviderStateMixin {
  ///
  late AnimationController animationController;
  Animation<Matrix4>? animation;

  ///
  late TransformationController transformationController;
  final double minScale = 1;
  final double maxScale = 14;

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
  Widget build(BuildContext context) {
    return InteractiveViewer(
      transformationController: transformationController,
      onInteractionEnd: (details) => resatStartAnimation(),

      /// important
      clipBehavior: Clip.none, // it will help to view over the screen
      // panEnabled: false, // it will disable moving image
      minScale: minScale, maxScale: maxScale,
      child: Image.network(
        'https://images.unsplash.com/photo-1433086966358-54859d0ed716?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80',
        fit: BoxFit.contain,
      ),
    );
  }

  void resatStartAnimation() {
    animation = Matrix4Tween(
            begin: transformationController.value, end: Matrix4.identity())
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.easeOut));

    /// it will automatically zoom out after releasing the finger
    animationController.forward(from: 0);
  }
}
