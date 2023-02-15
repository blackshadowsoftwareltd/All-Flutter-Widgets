import 'package:flutter/material.dart';
import '../components/appbars/appbar.dart' show CustomAppBar;

class TextFieleScreen extends StatelessWidget {
  const TextFieleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('TextFiled Screen'),
    );
  }
}
