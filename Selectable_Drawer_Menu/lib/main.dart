import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:select/Service.dart';

import 'HomePage.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<Services>(create: (_) => Services())],
      child: HomePage(),
    );
  }
}
