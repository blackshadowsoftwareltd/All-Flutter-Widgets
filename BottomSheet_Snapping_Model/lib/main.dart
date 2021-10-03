import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: TextButton(child: Text('Sheet'), onPressed: showSheet)));
  }

  Future showSheet() => showSlidingBottomSheet(context,
      builder: (context) => SlidingSheetDialog(
          cornerRadius: 20,
          avoidStatusBar: true,
          snapSpec: const SnapSpec(initialSnap: .5, snappings: [.3, .6, 1]),
          builder: buildSheet,
          headerBuilder: buildHeader));

  Widget buildSheet(context, state) => Material(
      color: Colors.white,

      /// ListView isn't support in SlidingBottomSheet
      /// LisView will be support if shrinkWrap is true
      child: Column(

          /// must need Builder widget for working expand
          children: [
            Builder(builder: (context) {
              return TextButton(
                  child: const Text('Read more'),
                  onPressed: () => SheetController.of(context)!.expand());
            }),
            Padding(padding: const EdgeInsets.all(8.0), child: Text(data)),
            Padding(padding: const EdgeInsets.all(8.0), child: Text(data)),
            Padding(padding: const EdgeInsets.all(8.0), child: Text(data)),
            Padding(padding: const EdgeInsets.all(8.0), child: Text(data)),
            Padding(padding: const EdgeInsets.all(8.0), child: Text(data)),
            Padding(padding: const EdgeInsets.all(8.0), child: Text(data)),
            Padding(padding: const EdgeInsets.all(8.0), child: Text(data)),
            Padding(padding: const EdgeInsets.all(8.0), child: Text(data)),
            Padding(padding: const EdgeInsets.all(8.0), child: Text(data)),
            Padding(padding: const EdgeInsets.all(8.0), child: Text(data))
          ]));

  ///
  Widget buildHeader(BuildContext context, SheetState state) => Material(
        child: Container(
          width: double.infinity,
          color: Colors.grey.shade300,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: 30,
                height: 8,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50)),
              )
            ],
          ),
        ),
      );

  ///
  String data =
      'adlsfjkasdiljf d jdl jladk jl djsl jflasd lasdj lasdj ldjsl jdlk lkdj lkads kdkl lkd k ldk lkd ldjlkf asdlkfoidfjasdnfds fds  jfoi hsdo ho hjof joasdi josdi fioandwsfnlasdbf kjnads j lkj flaused fjkln';
}
