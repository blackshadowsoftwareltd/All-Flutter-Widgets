import 'package:flutter/cupertino.dart';

class ListItem {
  final String brand;
  final String model;

  ListItem({required this.brand, required this.model});
}

final List<ListItem> listItems = [
  ListItem(brand: 'KTM', model: 'Duke 125'),
  ListItem(brand: 'Bajaj', model: 'Pulsar 160 NS'),
  ListItem(brand: 'Yamaha', model: 'FZ 150 S'),
  ListItem(brand: 'Suzuki', model: 'Gixar 150'),
  ListItem(brand: 'Honda', model: 'Rapsol 150'),
  ListItem(brand: 'TVS', model: 'Apaci 160'),
];
