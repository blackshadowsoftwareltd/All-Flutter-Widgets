import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> with RestorationMixin {
  @override
  // TODO: implement restorationId
  String? get restorationId => 'second_screen';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // TODO: implement restoreState
    registerForRestoration(textController, 'text_field_id');
  }

  ///
  RestorableTextEditingController textController =
      RestorableTextEditingController();

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: textController.value,
            decoration: const InputDecoration(hintText: 'Type here'),
          ),
        ),
      ),
    );
  }
}
