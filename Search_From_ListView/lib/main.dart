import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searched = '';

  TextEditingController controller;

  String values;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Search in ListView')),
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                          onChanged: (value) {
                            values = value;
                            result(value);
                          },
                          controller: controller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: 'Search here'))),
                  Expanded(
                      child: ListView.builder(
                          itemCount: cityes.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(cityes[index]),
                              onTap: () => print(cityes[index]),
                            );
                          }))
                ])));
  }

  void result(String query) {
    print('${query}');
    final citye = cityes.where((city) {
      final cityes = query.toString();
      final cityName = city.toLowerCase();
      return cityName.contains(cityes);
    }).toList();
    setState(() {
      cityes = citye;
    });
  }

  static final faker = Faker();
  static List<String> cityes =
      List.generate(400, (index) => faker.address.country());
}
//
// class CityData {
//   static final faker = Faker();
//   static final List<String> cityes =
//       List.generate(400, (index) => faker.address.country());
//
//   static List<String> getSuggestions(String query) =>
//       List.of(cityes).where((city) {
//         final cityes = query.toString();
//         final cityName = city.toLowerCase();
//         return cityName.contains(cityes);
//       }).toList();
// }
