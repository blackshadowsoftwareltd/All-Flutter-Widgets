import 'package:flutter/material.dart';
import '../components/appbars/appbar.dart' show CustomAppBar;
import 'components/elevated.dart' show ElevatedButtons;
import 'components/floating.dart' show FloatingActionButtons;
import 'components/icon_button.dart' show IconButtons;
import 'components/text_button.dart' show TextButtons;

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Buttons Screen'),
      body: SingleChildScrollView(
          child: Column(
        children: const [
          FloatingActionButtons(),
          ElevatedButtons(),
          TextButtons(),
          IconButtons(),
        ],
      )),
    );
  }
}
