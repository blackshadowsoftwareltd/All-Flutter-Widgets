import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:faker/faker.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Auto Complete TextField')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [citysFormField()],
        ),
      ),
    );
  }

  Widget citysFormField() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: TypeAheadFormField<String>(
          textFieldConfiguration: TextFieldConfiguration(
              controller: controller,
              decoration: InputDecoration(
                  labelText: 'Enter Country name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                      borderSide:
                          BorderSide(color: Colors.grey[900], width:1,)))),

          ///
          suggestionsCallback: CityData.getSuggestions,
          itemBuilder: (context, String suggestion) =>
              ListTile(title: Text(suggestion)),
          onSuggestionSelected: (String suggestion) {
            print(suggestion);
            controller.text = suggestion;
          },
        ),
      );
}

class CityData {
  static final faker = Faker();
  static final List<String> cityes =
      List.generate(400, (index) => faker.address.country());

  static List<String> getSuggestions(String query) =>
      List.of(cityes).where((city) {
        final cityes = query.toString();
        final cityName = city.toLowerCase();
        return cityName.contains(cityes);
      }).toList();
}
