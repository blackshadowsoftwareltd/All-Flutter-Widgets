import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'field.dart';
import 'service_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ServiceProvider>(create: (_) => ServiceProvider())
  ], child: MaterialApp(home: Home())));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('International Phone Field')),
        body: InternationalPhoneFields());
  }
}
