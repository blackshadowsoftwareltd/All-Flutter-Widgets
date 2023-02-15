import 'package:flutter/material.dart';
import '../../buttons/theme_button.dart' show ThemeButton;

class CustomAppBar extends AppBar {
  CustomAppBar(this.titleTxt, {super.key});
  final String titleTxt;

  @override
  Widget? get title => Text(titleTxt);

  @override
  List<Widget>? get actions => const [ThemeButton()];
}
