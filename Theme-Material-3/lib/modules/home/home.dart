import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart';
import 'package:theme_material_3/modules/components/appbars/appbar.dart'
    show CustomAppBar;
import 'package:theme_material_3/modules/buttons/buttons.dart'
    show ButtonScreen;
import 'package:theme_material_3/modules/textfields/text_field.dart'
    show TextFieleScreen;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Home Screen'),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const ButtonScreen())),
              child: const Text('Go to Button Screen')),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const TextFieleScreen())),
              child: const Text('Go to TextField Screen')),
        ]),
      ),
    );
  }
}
