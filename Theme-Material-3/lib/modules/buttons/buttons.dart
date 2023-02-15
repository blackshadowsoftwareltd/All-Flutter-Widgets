import 'package:flutter/material.dart';
import '../components/appbars/appbar.dart' show CustomAppBar;

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar('Buttons Screen'));
  }
}