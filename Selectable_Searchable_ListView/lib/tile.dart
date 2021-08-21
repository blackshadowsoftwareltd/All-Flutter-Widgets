import 'package:flutter/material.dart';
import 'package:selectedlist/model.dart';
import 'package:provider/provider.dart';

import 'provider_services.dart';

class Tile extends StatelessWidget {
  final Datum data;
  final bool isSelected;
  final ValueChanged<Datum> onSelected;

  const Tile(
      {Key? key,
      required this.data,
      required this.isSelected,
      required this.onSelected})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ServicesProvider>(context, listen: false);
    return InkWell(
        // onTap: () => onSelected(data),
        onTap: () {
          final isSelected = provider.selectedDistrict.contains(data);
          isSelected ? provider.removeData(data) : provider.addData(data);
        },
        child: Container(
            height: 50,
            color: isSelected
                ? Colors.green.withOpacity(.2)
                : Colors.green.withOpacity(.07),
            margin: EdgeInsets.all(5),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(data.district.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w300)),
                  Text(data.districtbn.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w300))
                ])));
  }
}
