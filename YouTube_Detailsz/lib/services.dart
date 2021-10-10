import 'package:http/http.dart' as http;

import 'model.dart';

/// base url
// https://www.youtube.com/oembed?url=<youtube-video_url_here>&format=json
///
class YouTubeServices {
  static Future<YouTubeVideoDetailsModel>? getDetails(String url) async {
    var headers = {'Cookie': 'VISITOR_INFO1_LIVE=3Wl3jSH_lqY; YSC=tkuapHcQqic'};
    var request = http.Request('GET',
        Uri.parse('https://www.youtube.com/oembed?url=$url&format=json'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String body = await response.stream.bytesToString();
      print(body);
      return YouTubeVideoDetailsModel.fromRawJson(body);
    } else {
      print(response.reasonPhrase);
      return YouTubeVideoDetailsModel();
    }
  }
}
