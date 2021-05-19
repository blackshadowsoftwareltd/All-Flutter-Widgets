import 'package:flutter/material.dart';

import 'package:just_audio/just_audio.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer player;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///
    player = AudioPlayer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    ///
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String firebaseAudioPath =
        'https://firebasestorage.googleapis.com/v0/b/test-8502d.appspot.com/o/audio%2FDreamy-ambient-background-music-loop.mp3?alt=media&token=96a7cc2b-14c8-4fe9-b5a7-58c87d476bbb';
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('from assets'),
      OutlinedButton(
          onPressed: () async {
            await player.setAsset('assets/audios/sounds.mp3');
            player.play();
          },
          child: Text('Sounds')),
      Text('from network'),
      OutlinedButton(
          onPressed: () async {
            await player.setUrl(firebaseAudioPath);
            player.play();
          },
          child: Text('Sounds')),
    ])));
  }
}
