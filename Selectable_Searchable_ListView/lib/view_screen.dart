import 'package:flutter/material.dart';
import 'package:selectedlist/provider_services.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class PreViewScreen extends StatelessWidget {
  final List<Datum> data;

  const PreViewScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(context.read<ServicesProvider>().selectedDistrict.length != 0);
    return Scaffold(
        appBar: AppBar(
          title: Text('Selected District'),
          backgroundColor: Colors.green.withOpacity(.5),
        ),
        body: Column(children: [
          ...data.map((Datum e) => Container(
              width: double.infinity,
              height: 50,
              color: Colors.green.withOpacity(.2),
              margin: EdgeInsets.all(5),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(e.district.toString(), style: TextStyle(fontSize: 15)),
                    Text(e.districtbn.toString(),
                        style: TextStyle(fontSize: 15))
                  ])))
        ]));
  }
}
