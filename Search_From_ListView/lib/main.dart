import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller;
  List<String> filteredCities = [];
  String values;
  static final faker = Faker();
  static List<String> cityes =
      List.generate(50, (index) => faker.address.country());

  @override
  Widget build(BuildContext context) {
    print(cityes);
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
                          itemCount: filteredCities.length != 0
                              ? filteredCities.length
                              : cityes.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(filteredCities.length != 0
                                  ? filteredCities[index]
                                  : cityes[index]),
                              onTap: () => print(filteredCities.length != 0
                                  ? filteredCities[index]
                                  : cityes[index]),
                            );
                          }))
                ])));
  }

  void result(String query) {
    print('${query}');
    var citye = cityes.where((city) {
      var cityes = query.toLowerCase().toString();
      var cityName = city.toString().toLowerCase();

      return cityName.contains(cityes);
    }).toList();
    setState(() {
      filteredCities = citye;
      print(filteredCities);
    });
  }
}
