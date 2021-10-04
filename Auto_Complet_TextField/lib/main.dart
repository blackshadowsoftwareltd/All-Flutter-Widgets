import 'package:auto_conplet_textfield/district_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'api.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  TextEditingController zController = TextEditingController();
  List<DistrictInFo> cities = [];

  TextEditingController controller = TextEditingController();
  List<String> cityes = [];
  String? selectedDistrict, zSelectedDistrict;

  @override
  Widget build(BuildContext context) {
    getDataFromApi();
    getFromApi();
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              /// with model
              Text('With List<Model>'),
              Container(
                  padding: EdgeInsets.all(5),
                  child: TypeAheadField<DistrictInFo>(
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: zController,
                          decoration: InputDecoration(
                              labelText: 'Enter District name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  borderSide: BorderSide(
                                    color: Colors.grey[900]!,
                                    width: 1,
                                  )))),
                      suggestionsCallback: getDistrictSuggestions,
                      itemBuilder: (context, DistrictInFo data) =>
                          ListTile(title: Text(data.district.toString())),
                      onSuggestionSelected: (DistrictInFo data) {
                        print(data.district);
                        zController.text = data.district!;
                        zSelectedDistrict = data.district;
                      })),

              /// with String
              Text('With List<String>'),
              Container(
                  padding: EdgeInsets.all(5),
                  child: TypeAheadField<String>(
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: controller,
                          decoration: InputDecoration(
                              labelText: 'Enter District name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  borderSide: BorderSide(
                                    color: Colors.grey[900]!,
                                    width: 1,
                                  )))),
                      suggestionsCallback: getSuggestions,
                      itemBuilder: (context, String suggestion) =>
                          ListTile(title: Text(suggestion)),
                      onSuggestionSelected: (String suggestions) {
                        print(suggestions);
                        controller.text = suggestions;
                        selectedDistrict = suggestions;
                      }))
            ])),
        floatingActionButton: FloatingActionButton(onPressed: () {
          print(selectedDistrict);
          print(zSelectedDistrict);
        }));
  }

  /// with model
  void getDataFromApi() {
    final data = DistrictApi.getDistrictData().then((value) {
      cities.clear();
      value.data!.map((DistrictInFo e) => cities.add(e)).toList();
      return true;
    });
  }

  List<DistrictInFo> getDistrictSuggestions(String query) =>
      List.of(cities).where((element) {
        final text = query.toLowerCase();
        final citieName = element.district!.toLowerCase();
        return citieName.contains(text);
      }).toList();

  /// with String
  void getFromApi() {
    cityes.clear();
    final value = DistrictApi.getDistrictData().then((value) {
      value.data!.map((dynamic e) {
        cityes.add(e.district);
      }).toList();
      return true;
    });
  }

  ///
  List<String> getSuggestions(String query) => List.of(cityes).where((element) {
        final cityes = query.toString();
        final cityName = element.toLowerCase();
        return cityName.contains(cityes);
      }).toList();
}
