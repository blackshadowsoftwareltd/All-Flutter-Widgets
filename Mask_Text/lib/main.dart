import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: TextImageMask(
                text: Text('R',
                    style:
                        TextStyle(fontSize: 550, fontWeight: FontWeight.w900)),
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1515446134809-993c501ca304?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80'))));
  }
}

class TextImageMask extends StatelessWidget {
  final ImageProvider image;
  final Widget text;

  const TextImageMask({Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
        future: loadImage(),
        builder: (context, snapshot) => snapshot.hasData
            ? ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (Rect bounds) => ImageShader(snapshot.data!,
                    TileMode.clamp, TileMode.clamp, Matrix4.identity().storage),
                child: text)
            : Container());
  }

  Future<ui.Image> loadImage() async {
    final completer = Completer<ui.Image>();
    final stream = image.resolve(const ImageConfiguration());
    stream.addListener(
        ImageStreamListener((info, _) => completer.complete(info.image)));
    return completer.future;
  }
}
