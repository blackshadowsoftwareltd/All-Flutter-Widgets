import 'package:flutter/material.dart';
import 'package:store_redirect/store_redirect.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text('Open App with PlayStore')),
        body: Center(
            child: OutlinedButton(
                child: const Text('Open Play Store'),
                onPressed: () {
                  StoreRedirect.redirect(
                      androidAppId: "com.blackshadowsoftware.dronercworld",
                      iOSAppId: "0000000");
                })));
  }
}
