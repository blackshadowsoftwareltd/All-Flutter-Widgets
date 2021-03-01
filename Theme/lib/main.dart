import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ThemeProvider.dart';

void main() => runApp(

    /// Change notifier for Provider StateManegement
    ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider =
              Provider.of<ThemeProvider>(context, listen: true);

          /// return MaterialApp()
          return MaterialApp(
            home: HomePage(),

            /// ThemeMode for systems default themes
            themeMode: themeProvider.themeMode,

            /// Light Theme
            theme: MyThemes.lightTheme,

            /// Dark Theme
            darkTheme: MyThemes.darkTheme,
          );
        }));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    /// Condition for checking current themeMode
    final _text = Provider.of<ThemeProvider>(context, listen: true).themeMode ==
            ThemeMode.dark
        ? 'Dark Mode'
        : 'Light Mode';
    final _color =
        Provider.of<ThemeProvider>(context, listen: true).themeMode ==
                ThemeMode.dark
            ? Colors.blue
            : Colors.grey[400];
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Mode : $_text'),
        actions: [ThemeModeButton()],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Primary color ',
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).primaryColor),
            ),
            Text(
              'Custom color ',
              style: TextStyle(fontSize: 20, color: _color),
            ),
          ],
        ),
      ),
    );
  }
}
