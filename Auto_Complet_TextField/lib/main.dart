import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'api.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  List<String> cityes = [];
  String? selectedDistrict;

  @override
  Widget build(BuildContext context) {
    getFromApi();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
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
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print(selectedDistrict)
      )
    );
  }

  ///
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
