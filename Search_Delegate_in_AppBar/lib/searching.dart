import 'package:flutter/material.dart';

import 'home.dart';

class SearchingDelegate extends SearchDelegate {
  List<String> suggestion = [
    'Afghanstan',
    'Bahrain',
    'Bangladesh',
    'Syria',
    'Morocco',
    'IR Iran',
    'Pakistan',
    'Qatar',
    'Yemen'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isNotEmpty) {
                query = '';
              } else {
                close(context, null);
              }
            },
            icon: const Icon(Icons.close))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back_ios));

  @override
  Widget buildResults(BuildContext context) => Center(child: Text(query));

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> countries = suggestion.where((element) {
      final result = element.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    ///
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(countries[index]),
        onTap: () {
          query = countries[index];
          showResults(context);
        },
      ),
    );
  }
}
