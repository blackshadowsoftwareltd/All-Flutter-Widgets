import 'district_model.dart';
import 'package:http/http.dart' as http;

class DistrictApi {
 static Future<DistrictModel> getDistrictData() async {
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
