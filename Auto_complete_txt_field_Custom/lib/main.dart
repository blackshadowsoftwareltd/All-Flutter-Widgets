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
            print(v);
            return ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'];
          },
        ),
        Text('data'),
        AutoCompleteTextField<GL>(
          displayStringForOption: (v) => v.name,
          initialValue: const TextEditingValue(text: 'initial'),
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.clear_all),
          ),
          onChanged: (v) async {
            print(v);
          },
          onSelected: (v) async {
            print(v);
          },
          optionsBuilder: (v) => gls.where(
              (e) => e.name.toLowerCase().contains(v.text.toLowerCase())),
        )
      ]),
    );
  }
}

const gls = [
  GL(id: 1, name: 'GL 1'),
  GL(id: 2, name: 'GL 2'),
  GL(id: 3, name: 'GL 3'),
  GL(id: 4, name: 'GL 4'),
  GL(id: 5, name: 'GL 5'),
  GL(id: 6, name: 'GL 6'),
  GL(id: 7, name: 'GL 7'),
  GL(id: 8, name: 'GL 8'),
  GL(id: 9, name: 'GL 9'),
  GL(id: 10, name: 'GL 10'),
  GL(id: 11, name: 'GL 11'),
  GL(id: 12, name: 'GL 12'),
  GL(id: 13, name: 'GL 13'),
  GL(id: 14, name: 'GL 14'),
  GL(id: 15, name: 'GL 15'),
  GL(id: 16, name: 'GL 16'),
  GL(id: 17, name: 'GL 17'),
  GL(id: 18, name: 'GL 18'),
  GL(id: 19, name: 'GL 19'),
  GL(id: 20, name: 'GL 20'),
  GL(id: 21, name: 'GL 21'),
  GL(id: 22, name: 'GL 22'),
  GL(id: 23, name: 'GL 23'),
  GL(id: 24, name: 'GL 24'),
  GL(id: 25, name: 'GL 25'),
  GL(id: 26, name: 'GL 26'),
  GL(id: 27, name: 'GL 27'),
  GL(id: 28, name: 'GL 28'),
  GL(id: 29, name: 'GL 29'),
  GL(id: 30, name: 'GL 30'),
  GL(id: 31, name: 'GL 31'),
  GL(id: 32, name: 'GL 32'),
  GL(id: 33, name: 'GL 33'),
  GL(id: 34, name: 'GL 34'),
  GL(id: 35, name: 'GL 35'),
];

class GL {
  const GL({required this.id, required this.name});
  final int id;
  final String name;
}
