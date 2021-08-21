import 'package:http/http.dart' as http;
import 'package:selectedlist/model.dart';

class Apis {
  static Future<DistrictModel>? data() async {
    var request = http.Request(
        'GET', Uri.parse('https://bdapis.herokuapp.com/api/v1.1/districts'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String body = await response.stream.bytesToString();
      print(body);
      return DistrictModel.fromRawJson(body);
    } else {
      print(response.reasonPhrase);
      return DistrictModel();
    }
  }
}
