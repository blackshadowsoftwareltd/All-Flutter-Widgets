import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var config = BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      autoPlay: true,
      // startAt: Duration(seconds: 2),
      looping: false,
      // showPlaceholderUntilPlay: true,
      // fullScreenAspectRatio: 16/9,
      // fullScreenByDefault: false,
      allowedScreenSleep: false,
      // fit: BoxFit.fitWidth,
      autoDetectFullscreenDeviceOrientation: true,
      controlsConfiguration: BetterPlayerControlsConfiguration(
          showControls: true,
          enableAudioTracks: true,
          enableFullscreen: true,
          enableMute: true,
          enableProgressText: true,
          enableProgressBarDrag: true,
          enableProgressBar: true,
          enablePlayPause: true,
          enableSkips: true,
          liveTextColor: Colors.blue,
          progressBarBackgroundColor: Colors.green,
          progressBarBufferedColor: Colors.yellow,
          progressBarHandleColor: Colors.deepOrange,
          progressBarPlayedColor: Colors.red,
          overflowMenuIconsColor: Colors.purple,
          loadingColor: Colors.white,
          backgroundColor: Colors.grey[100],
          enableOverflowMenu: true,
          enablePlaybackSpeed: true,
          enableQualities: true,
          enableRetry: true));

  @override
  Widget build(BuildContext context) {
    String firebasePathUrl =
        'https://firebasestorage.googleapis.com/v0/b/test-8502d.appspot.com/o/video%2FTrailer.mp4?alt=media&token=9beeb525-3d6d-43ee-ac33-ca470db1a34f';
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.topCenter,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: BetterPlayer.network(
            firebasePathUrl,
            betterPlayerConfiguration: config,
          ),
        ),
      ),
    );
  }
}
