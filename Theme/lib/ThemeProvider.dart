import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyThemes {
  static final darkTheme = ThemeData(

      /// Scaffold color
      scaffoldBackgroundColor: Colors.grey[900],

      /// Text color
      colorScheme: ColorScheme.dark(),

      /// primary Color
      primaryColor: Colors.deepOrange);

  static final lightTheme = ThemeData(

      /// Scaffold color
      scaffoldBackgroundColor: Colors.white,

      /// Text color
      colorScheme: ColorScheme.light(),

      /// primary Color
      primaryColor: Colors.green);
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  /// this method will change theme when someone toggle
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class ThemeModeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}
