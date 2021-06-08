import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animated_text/animated_text.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  final text = 'Flutter App Developer';
  final styles =
      TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold);
  final colors = [
    Colors.green[600],
    Colors.blue[600],
    Colors.red[600],
    Colors.purple[600],
    Colors.yellow[600]
  ];
  final colorStyle = TextStyle(fontSize: 40, fontWeight: FontWeight.w900);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  /// Animated Text Kit package
                  AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('Typewriter Animated Text',
                            textStyle: styles)
                      ],
                      totalRepeatCount: 20,
                      pause: Duration(seconds: 1),
                      stopPauseOnTap: true),
                  AnimatedTextKit(
                      animatedTexts: [
                        FadeAnimatedText('Fade Animated Text',
                            textStyle: TextStyle(
                                fontSize: 32.0, fontWeight: FontWeight.bold))
                      ],
                      totalRepeatCount: 20,
                      pause: Duration(seconds: 1),
                      stopPauseOnTap: true),
                  AnimatedTextKit(
                      animatedTexts: [
                        ScaleAnimatedText('Scale Animated Text',
                            textStyle: styles),
                      ],
                      totalRepeatCount: 20,
                      pause: Duration(seconds: 1),
                      stopPauseOnTap: true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('This is ', style: styles),
                      AnimatedTextKit(
                          animatedTexts: [
                            RotateAnimatedText(' Rotate ', textStyle: styles),
                            RotateAnimatedText(' Animated ', textStyle: styles),
                            RotateAnimatedText(' Text ', textStyle: styles)
                          ],
                          totalRepeatCount: 20,
                          pause: Duration(seconds: 1),
                          stopPauseOnTap: true),
                    ],
                  ),
                  AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText('Typer Animated Text',
                            textStyle: styles)
                      ],
                      totalRepeatCount: 20,
                      pause: Duration(seconds: 1),
                      stopPauseOnTap: true),
                  AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText('Wavy Animated Text',
                            textStyle: styles)
                      ],
                      isRepeatingAnimation: true,
                      totalRepeatCount: 20,
                      pause: Duration(seconds: 1),
                      stopPauseOnTap: true),
                  AnimatedTextKit(
                      animatedTexts: [
                        FlickerAnimatedText('FlickerAnimatedText',
                            textStyle: styles)
                      ],
                      isRepeatingAnimation: true,
                      totalRepeatCount: 20,
                      pause: Duration(seconds: 1),
                      stopPauseOnTap: true),
                  AnimatedTextKit(
                      animatedTexts: [
                        ColorizeAnimatedText('Colorize',
                            textStyle: colorStyle, colors: colors),
                        ColorizeAnimatedText('Animated',
                            textStyle: colorStyle, colors: colors),
                        ColorizeAnimatedText('Text',
                            textStyle: colorStyle, colors: colors)
                      ],
                      totalRepeatCount: 20,
                      pause: Duration(seconds: 1),
                      stopPauseOnTap: true),
                  SizedBox(
                      width: 250.0,
                      child: TextLiquidFill(
                          text: 'Text Liquid Fill',
                          waveColor: Colors.blue,
                          boxBackgroundColor: Colors.red,
                          textStyle: colorStyle,
                          boxHeight: 100.0))
                ]))));
  }
}
