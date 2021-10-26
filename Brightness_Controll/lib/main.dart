import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_wake/flutter_screen_wake.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double brightness = 0.0;
  bool toggle = false;

  ///
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Controll Phone Brightness')),
        body: Center(
            child: Container(
                height: 70,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey, width: 3)),

                ///
                child: Row(children: [
                  AnimatedCrossFade(
                      firstChild: const Icon(Icons.brightness_7, size: 40),
                      secondChild: const Icon(Icons.brightness_3, size: 40),
                      crossFadeState: toggle
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 500)),

                  ///
                  Flexible(
                      child: Slider(
                          value: brightness,
                          onChanged: (value) async {
                            setState(() => brightness = value);
                            await FlutterScreenWake.setBrightness(brightness);
                            if (brightness == 0)
                              toggle = true;
                            else
                              toggle = false;
                          })),

                  ///
                  Text(brightness.toStringAsFixed(2))
                ]))));
  }

  Future<void> initPlatformBrightness() async {
    /// extra features if this package
// Check if the screen is kept on:
// bool isKeptOn = await FlutterScreenWake.isKeptOn;

// Prevent screen from going into sleep mode:
// FlutterScreenWake.keepOn(true);

    ///
    double bright;
    try {
      bright = await FlutterScreenWake.brightness;
    } on PlatformException {
      bright = 1.1;
    }
    if (!mounted) return;
    setState(() => brightness = bright);
  }
}
