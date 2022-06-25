import 'package:flutter/material.dart';

class SlideRightAnimation extends StatefulWidget {
  const SlideRightAnimation(
      {Key? key, required this.widget, required this.initDelay})
      : super(key: key);
  final Widget widget;
  final Duration initDelay;
  @override
  State<SlideRightAnimation> createState() => _SlideRightAnimationState();
}

class _SlideRightAnimationState extends State<SlideRightAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    initialDelay();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => Opacity(
            opacity: _animation.value,
            child: Transform.translate(

                ///! widget
                child: widget.widget,
                offset: Offset((-50.0 * (1 - _animation.value)), 0))),

        ///! widget
        child: widget.widget);
  }

  Future<void> initialDelay() async {
    await Future.delayed(widget.initDelay);
    if (mounted) {
      _animationController.reset();
      _animationController.forward();
    }
  }
}
