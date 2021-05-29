import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  var youtubePath = 'https://www.youtube.com/watch?v=fq4qP2oSpIA';

  @override
  Widget build(BuildContext context) {
    ///
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(youtubePath),
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: false,
        loop: false,
        forceHD: false,
        isLive: false,
      ),
    );

    ///
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
        ),
      ),
    );
  }
}
