import 'package:flutter/material.dart';

import 'auto_complete.dart' show AutoCompleteTextField;

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auto complete Text field')),
      body: Column(children: [
        AutoCompleteTextField(
          optionsBuilder: (v) {
            debugPrint(v.toString());
            return ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'];
          },
        ),
        AutoCompleteTextField<Country>(
          displayStringForOption: (v) => v.name,
          initialValue: const TextEditingValue(text: ''),
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.clear_all),
          ),
          onChanged: (v) async {
            debugPrint(v.toString());
          },
          onSelected: (v) async {
            debugPrint(v.toString());
          },
          optionsBuilder: (v) => countries.where(
              (e) => e.name.toLowerCase().contains(v.text.toLowerCase())),
        )
      ]),
    );
  }
}

const countries = [
  Country(id: 1, name: 'Afghanistan'),
  Country(id: 2, name: 'Albania'),
  Country(id: 3, name: 'Algeria'),
  Country(id: 4, name: 'Andorra'),
  Country(id: 5, name: 'Angola'),
  Country(id: 6, name: 'Antigua and Barbuda'),
  Country(id: 7, name: 'Argentina'),
  Country(id: 8, name: 'Armenia'),
  Country(id: 9, name: 'Australia'),
  Country(id: 10, name: 'Austria'),
  Country(id: 11, name: 'Azerbaijan'),
  Country(id: 12, name: 'Bahamas'),
  Country(id: 13, name: 'Bahrain'),
  Country(id: 14, name: 'Bangladesh'),
  Country(id: 15, name: 'Barbados'),
  Country(id: 16, name: 'Belarus'),
  Country(id: 17, name: 'Belgium'),
  Country(id: 18, name: 'Belize'),
  Country(id: 19, name: 'Benin'),
  Country(id: 20, name: 'Bhutan'),
  Country(id: 21, name: 'Bolivia'),
  Country(id: 22, name: 'Bosnia and Herzegovina'),
  Country(id: 23, name: 'Botswana'),
  Country(id: 24, name: 'Brazil'),
  Country(id: 25, name: 'Brunei'),
  Country(id: 26, name: 'Bulgaria'),
  Country(id: 27, name: 'Burkina Faso'),
  Country(id: 28, name: 'Burundi'),
  Country(id: 29, name: 'Cabo Verde'),
  Country(id: 30, name: 'Cambodia'),
  Country(id: 31, name: 'Cameroon'),
  Country(id: 32, name: 'Canada'),
  Country(id: 33, name: 'Central African Republic (CAR)'),
  Country(id: 34, name: 'Chad'),
  Country(id: 35, name: 'Chile'),
  Country(id: 36, name: 'China'),
  Country(id: 37, name: 'Colombia'),
  Country(id: 38, name: 'Comoros'),
  Country(id: 39, name: 'Democratic Republic of the Congo'),
  Country(id: 40, name: 'Republic of the Congo'),
  Country(id: 41, name: 'Costa Rica'),
  Country(id: 42, name: "Cote d'Ivoire"),
  Country(id: 43, name: 'Croatia'),
  Country(id: 44, name: 'Cuba'),
  Country(id: 45, name: 'Cyprus'),
  Country(id: 46, name: 'Czech Republic'),
  Country(id: 47, name: 'Denmark'),
  Country(id: 48, name: 'Djibouti'),
];

class Country {
  final int id;
  final String name;
  const Country({required this.id, required this.name});
}
