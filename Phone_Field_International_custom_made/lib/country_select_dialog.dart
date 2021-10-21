import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:international_phone/countries.dart';
import 'package:provider/provider.dart';

import 'service_provider.dart';

class CountrySelectDialog extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ServiceProvider>(context, listen: false);
    final serviceProvider = Provider.of<ServiceProvider>(context, listen: true);

    ///
    final data = serviceProvider.country.where((Country e) {
      final text = e.name.toLowerCase();
      return text.contains(provider.searchText.toLowerCase());
    }).toList();

    ///
    return Center(
      child: Card(
          color: Colors.white,
          elevation: 20,
          shadowColor: Colors.black38,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
              width: MediaQuery.of(context).size.width - 30,
              height: MediaQuery.of(context).size.height - 100,
              padding: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(children: [
                Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: TextField(
                        style: const TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            hintText: 'Search by country name',
                            hintStyle: const TextStyle(fontSize: 18),
                            prefixIcon: const Icon(Icons.search),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black38, width: .5),
                                borderRadius: BorderRadius.circular(10))),
                        controller: controller,
                        onChanged: (text) => provider.setSearchText(text))),

                ///
                Flexible(
                    child: ListView.separated(
                        itemCount: data.length,
                        separatorBuilder: (context, index) =>
                            const Divider(height: 1, color: Colors.black38),
                        itemBuilder: (context, index) => Material(
                              color: Colors.transparent,
                              child: InkWell(
                                  onTap: () {
                                    provider.setSelected(data[index]);
                                    controller.clear();
                                    provider.setSearchText('');
                                    Navigator.pop(context);
                                  },
                                  splashColor: Colors.black12,
                                  highlightColor: Colors.black12,
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      height: 50,
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                width: 90,
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                          width: 30,
                                                          child: Image.asset(
                                                              'assets/flags/${data[index].code.toLowerCase()}.png')),
                                                      const SizedBox(width: 10),
                                                      Text(
                                                          '+' +
                                                              data[index]
                                                                  .dialCode,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))
                                                    ])),
                                            const SizedBox(width: 10),
                                            Flexible(
                                                child: Text(data[index].name,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)))
                                          ]))),
                            )))
              ]))),
    );
  }
}
