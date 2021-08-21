import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'home.dart'; 
import 'provider_services.dart';

void main() => runApp(MaterialApp(
        home: MultiProvider(providers: [
      ChangeNotifierProvider<ServicesProvider>(
          create: (_) => ServicesProvider())
    ], child: Home())));


