import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';
import 'provider_services.dart';
import 'searchbar.dart';
import 'tile.dart';
import 'view_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ServicesProvider>(context, listen: false);
    provider.getData();
    return Scaffold(
        appBar: AppBar(
            title: Text('Selectable Searchable ListView'),
            backgroundColor: Colors.green.withOpacity(.5),
            actions: [
              IconButton(
                  onPressed: () => provider.removeAll(),
                  icon: Icon(
                    Icons.clear_all,
                    size: 30,
                  )),
              Center(
                  child: Text(
                ' ${context.watch<ServicesProvider>().selectedDistrict.length.toString()} Selected',
                style: TextStyle(fontSize: 16),
              ))
            ],

            ///
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: SearchWidgets(
                  text: provider.text,
                  onChangedCallBack: (text) => provider.setText(text),
                  hintText: 'Search...',
                ))),

        ///
        body: FutureBuilder(
            future: provider.isLoad,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = provider.districts.where((Datum e) {
                  final districtName = e.district!.toLowerCase();
                  final text = provider.text.toLowerCase();
                  return districtName.contains(text);
                }).toList();

                ///
                return ListView(
                    children: data.map((e) {
                  final isSelected = context
                      .watch<ServicesProvider>()
                      .selectedDistrict
                      .contains(e);
                  return Tile(
                      data: e, isSelected: isSelected, onSelected: (e) {});
                }).toList());

                ///
              } else
                return Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green.withOpacity(.5),
            child: Text('View'),
            onPressed: () {
              final data = context.read<ServicesProvider>().selectedDistrict;
              Navigator.push(
                  context,
                  (MaterialPageRoute(
                      builder: (context) => PreViewScreen(data: data))));
            }));
  }
}
