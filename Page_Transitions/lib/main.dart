import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:page_transitionsz/second_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Page Transitions')),
      body: ListView(
        children: [
          /// optional feature
          /// alignment
          /// druation
          /// reverseDuration
          /// curve (not useful)
          ///
          OutlinedButton(
              child: const Text('Top To Bottom'),
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      child: const SecondScreen(),
                      type: PageTransitionType.topToBottom))),

          ///
          OutlinedButton(
              child: const Text('Bottom To Top'),
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      child: const SecondScreen(),
                      type: PageTransitionType.bottomToTop))),

          ///
          OutlinedButton(
              child: const Text('Left To Right'),
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      child: const SecondScreen(),
                      type: PageTransitionType.leftToRight))),

          ///
          OutlinedButton(
              child: const Text('Right To Left'),
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      child: const SecondScreen(),
                      type: PageTransitionType.rightToLeft))),

          ///
          OutlinedButton(
              child: const Text('Right To Left Joined'),
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      childCurrent:
                          this, // if stateless=> this. ifstatefull=> widget
                      duration: const Duration(milliseconds: 500),
                      reverseDuration: const Duration(milliseconds: 500),
                      child: const SecondScreen(),
                      type: PageTransitionType.rightToLeftJoined))),

          ///
          OutlinedButton(
              child: const Text('Left To Right Joined'),
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      childCurrent:
                          this, // if stateless=> this. ifstatefull=> widget
                      duration: const Duration(milliseconds: 500),
                      reverseDuration: const Duration(milliseconds: 500),
                      child: const SecondScreen(),
                      type: PageTransitionType.leftToRightJoined))),

          /// It depends on Alignment
          OutlinedButton(
              child: const Text('Fade'),
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      child: const SecondScreen(),
                      type: PageTransitionType.fade))),

          /// It depends on Alignment
          OutlinedButton(
              child: const Text('Left To Right With Fade'),
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 1000),
                      reverseDuration: const Duration(milliseconds: 1000),
                      child: const SecondScreen(),
                      type: PageTransitionType.leftToRightWithFade))),

          /// It depends on Alignment
          OutlinedButton(
              child: const Text('Right To Left With Fade'),
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 1000),
                      reverseDuration: const Duration(milliseconds: 1000),
                      child: const SecondScreen(),
                      type: PageTransitionType.rightToLeftWithFade))),

          /// It depends on Alignment
          OutlinedButton(
              child: const Text('Scale (center)'),
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 1000),
                      reverseDuration: const Duration(milliseconds: 1000),
                      alignment: Alignment.center,
                      child: const SecondScreen(),
                      type: PageTransitionType.scale))),

          /// It depends on Alignment
          OutlinedButton(
              child: const Text('Scale (Center Left)'),
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 1000),
                      reverseDuration: const Duration(milliseconds: 1000),
                      alignment: Alignment.centerLeft,
                      child: const SecondScreen(),
                      type: PageTransitionType.scale))),

          /// It depends on Alignment
          OutlinedButton(
              child: const Text('Scale (Top Left)'),
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 1000),
                      reverseDuration: const Duration(milliseconds: 1000),
                      alignment: Alignment.topLeft,
                      child: const SecondScreen(),
                      type: PageTransitionType.scale))),

          /// It depends on Alignment
          OutlinedButton(
              child: const Text('Size (Center)'),
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 1000),
                      reverseDuration: const Duration(milliseconds: 1000),
                      alignment: Alignment.center,
                      child: const SecondScreen(),
                      type: PageTransitionType.size))),

          /// It depends on Alignment
          OutlinedButton(
              child: const Text('Size (Top)'),
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 1000),
                      reverseDuration: const Duration(milliseconds: 1000),
                      alignment: Alignment.topCenter,
                      child: const SecondScreen(),
                      type: PageTransitionType.size))),

          /// It depends on Alignment
          OutlinedButton(
              child: const Text('Rotate (Center)'),
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 1000),
                      reverseDuration: const Duration(milliseconds: 1000),
                      child: const SecondScreen(),
                      type: PageTransitionType.rotate))),

          /// It depends on Alignment
          OutlinedButton(
              child: const Text('Rotate (Top)'),
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      alignment: Alignment.topCenter,
                      duration: const Duration(milliseconds: 1000),
                      reverseDuration: const Duration(milliseconds: 1000),
                      child: const SecondScreen(),
                      type: PageTransitionType.rotate))),

          /// It depends on Alignment
          OutlinedButton(
              child: const Text('Rotate (Top Left)'),
              onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      alignment: Alignment.topLeft,
                      duration: const Duration(milliseconds: 1000),
                      reverseDuration: const Duration(milliseconds: 1000),
                      child: const SecondScreen(),
                      type: PageTransitionType.rotate))),

          ///
        ],
      ),
    );
  }
}
