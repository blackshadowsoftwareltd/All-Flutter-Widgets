import 'package:flutter/material.dart' show ThemeData;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show Notifier, NotifierProvider;
import 'package:theme_material_3/helpers/themes/light.dart' show lightTheme;
import '../../helpers/themes/dark.dart' show darkTheme;

final themeProvider = NotifierProvider<_Theme, ThemeData>(_Theme.new);

class _Theme extends Notifier<ThemeData> {
  @override
  ThemeData build() => lightTheme;

  void toggle() {
    state = state == lightTheme ? darkTheme : lightTheme;
  }
}
