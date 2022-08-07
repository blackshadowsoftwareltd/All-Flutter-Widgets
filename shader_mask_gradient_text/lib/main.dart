import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<Color> colors = List<Color>.generate(
      8,
      (index) =>
          index.isOdd ?  Colors.blue :   Colors.green);
  List<double> stops = List<double>.generate(8, (index) => index * 0.2 - 0.4);
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    animation = Tween<double>(begin: .0, end: .4).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
          controller.forward();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ShaderMask(
        shaderCallback: (bounds) => SweepGradient(
                colors: colors,
                stops: stops.map((s) => s + animation.value).toList())
            .createShader(bounds),
        child: const Text(
          'REMON\nAHAMMAD',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w900,
              height: .9),
        ),
      )),
    );
  }
}
