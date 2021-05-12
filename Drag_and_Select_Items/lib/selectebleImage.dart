
import 'package:flutter/material.dart';

class SelectebleImage extends StatefulWidget {
  final String imgUrl;
  final bool isSelected;

  const SelectebleImage(
      {Key key, @required this.imgUrl, @required this.isSelected})
      : super(key: key);
  @override
  _SelectebleImageState createState() => _SelectebleImageState();
}

class _SelectebleImageState extends State<SelectebleImage>

    /// this line will be added after class 'this SingleTickerProviderStateMixin' and 'vsync:this'
    with
        SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// Animation controller
    controller = AnimationController(
        vsync: this,
        value: widget.isSelected ? 1 : 0,
        duration: Duration(milliseconds: 300));

    ///  scale animation controller
    scaleAnimation = Tween<double>(begin: .8, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  void didUpdateWidget(covariant SelectebleImage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) if (widget.isSelected)
      controller.forward();
    else
      controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(widget.isSelected ? 0 : 10),
      child: AnimatedBuilder(
        animation: scaleAnimation,
        builder: (context, child) => Transform.scale(
            scale: scaleAnimation.value,
            child: ClipRRect(
                child: child,
                borderRadius:
                    BorderRadius.circular(widget.isSelected ? 80 : 20))),
        child: Image.network(
          widget.imgUrl,
          fit: BoxFit.cover
        )
      )
    );
  }
}

class PreviewImages extends StatelessWidget {
  final List<String> urlImage;

  const PreviewImages({Key key, @required this.urlImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Preview Image')),
      body: ListView(
        children: urlImage
            .map((images) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(images)
                ))
            .toList()
      )
    );
  }
}
