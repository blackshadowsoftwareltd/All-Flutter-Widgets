import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final quickActions = QuickActions();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// shortcuts
    /// Icon Downloaded from https://fonts.google.com/icons // .png
    /// then past it on android/app/src/main/res/drawable ->>
    /// and mention them without file extensions
    quickActions.setShortcutItems([
      const ShortcutItem(
          type: 'product', localizedTitle: 'Product', icon: 'products'),// mention them without file extensions
      const ShortcutItem(
          type: 'message', localizedTitle: 'New Message', icon: 'message'),//mention them without file extensions
    ]);

    ///  initialize
    quickActions.initialize((type) {
      if (type == 'product') {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => const ProductScreen()));
      } else if (type == 'message') {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => const MessageScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Home')));
  }
}

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Product Screen')));
  }
}

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Message Screen')));
  }
}
