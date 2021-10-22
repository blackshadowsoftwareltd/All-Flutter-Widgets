import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service_provider.dart';
import 'countries.dart';

/// field
class InternationalPhoneFields extends StatelessWidget {
  final numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ServiceProvider>(context, listen: false);
    final serviceProvider = Provider.of<ServiceProvider>(context, listen: true);

    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: CupertinoTextField(
          controller: numberController,
          placeholder: 'Phone Number',
          keyboardType: TextInputType.number,
          maxLength: provider.selected.maxLength,
          onChanged: (text) {
            if (text.length == provider.selected.maxLength) {
              provider.setPhoneNumber('+${provider.selected.dialCode}$text');
            } else
              provider.setPhoneNumber(null);
          },
          style: TextStyle(
              color: serviceProvider.phoneNumber != null
                  ? Colors.black
                  : Colors.black54,
              fontSize: 18,
              fontWeight: serviceProvider.phoneNumber != null
                  ? FontWeight.w500
                  : FontWeight.w400),
          placeholderStyle:
              const TextStyle(color: Colors.black45, fontSize: 18),
          prefix: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () => showModal(
                          context: context,
                          configuration: const FadeScaleTransitionConfiguration(
                              barrierColor: Colors.transparent),
                          builder: (context) => CountrySelectDialog()),
                      child: Container(
                          // margin: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          width: 120,
                          height: 35,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    height: 20,
                                    child: Image.asset(
                                        'assets/flags/${serviceProvider.selected.code.toLowerCase()}.png')),
                                Text('+' + serviceProvider.selected.dialCode,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500))
                              ]))))),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          cursorColor: Colors.black54,
          clearButtonMode: OverlayVisibilityMode.editing,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black12, width: .7),
              color: Colors.white)),

      //     onChanged: (text) => print('+${provider.selected.dialCode}$text'))
    );
  }
}

/// dialog
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
            elevation: 10,
            shadowColor: Colors.black87,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
                width: MediaQuery.of(context).size.width - 30,
                height: MediaQuery.of(context).size.height - 100,
                padding: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade50,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(children: [
                  /// text field
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: CupertinoTextField(
                          controller: controller,
                          onChanged: (text) => provider.setSearchText(text),
                          placeholder: 'Search by Country name',
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 18),
                          placeholderStyle: const TextStyle(
                              color: Colors.black54, fontSize: 17),
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 10),
                          prefix: const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(Icons.search, color: Colors.black54)),
                          cursorColor: Colors.black54,
                          clearButtonMode: OverlayVisibilityMode.editing,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white))),

                  /// list
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
                                          ]))))))
                ]))));
  }
}
