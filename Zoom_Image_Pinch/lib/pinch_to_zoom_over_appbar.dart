import 'package:flutter/material.dart';

class PinchToZoomImageOverAppBar extends StatefulWidget {
  const PinchToZoomImageOverAppBar({Key? key}) : super(key: key);

  @override
  State<PinchToZoomImageOverAppBar> createState() => _PinchToZoomImageState();
}

class _PinchToZoomImageState extends State<PinchToZoomImageOverAppBar>
    with SingleTickerProviderStateMixin {
  ///
  late AnimationController animationController;
  Animation<Matrix4>? animation;

  ///
  late TransformationController transformationController;
  final double minScale = 1; // minimum zoom
  final double maxScale = 14; // maximum zoom
  OverlayEntry? entry;

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
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              /// it will remove overlay
              removeOverlay();
            }
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
    return buildImage();
  }

  Widget buildImage() {
    return Builder(
        builder: (context) => InteractiveViewer(
            transformationController: transformationController,
            onInteractionEnd: (details) => resatStartAnimation(),
            onInteractionStart: (details) {
              if (details.pointerCount < 2) return;

              /// it will shwo overlay. over the screen
              showOverlay(context);
            },

            /// important
            clipBehavior: Clip.none, // it will help to view over the screen
            // panEnabled: false, // it will disable moving image
            minScale: minScale,
            maxScale: maxScale,
            child: Image.network(
                'https://images.unsplash.com/photo-1433086966358-54859d0ed716?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80',
                fit: BoxFit.contain)));
  }

  void resatStartAnimation() {
    animation = Matrix4Tween(
            begin: transformationController.value, end: Matrix4.identity())
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.easeOut));

    /// it will automatically zoom out after releasing the finger
    // animationController.forward(from: 0);
  }

  void showOverlay(BuildContext context) {
    final renderBox = context.findRenderObject()! as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    ///
    final size = MediaQuery.of(context).size;

    ///
    entry = OverlayEntry(builder: (context) {
      return Positioned(
          width: size.width,
          left: offset.dx,
          top: offset.dy,
          child: buildImage());
    });
    final overlay = Overlay.of(context)!;
    overlay.insert(entry!);
  }

  void removeOverlay() {
    entry?.remove();
    entry = null;
  }
}
