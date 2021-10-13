import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Material Banner')),
        body: Center(
            child: OutlinedButton(
                child: const Text('Material Banner'),
                style: OutlinedButton.styleFrom(
                    primary: Colors.green,
                    animationDuration: const Duration(seconds: 5),
                    side: const BorderSide(color: Colors.green, width: .5)),

                /// normally .showMaterialBanner()
                ///  ..remove__()..show__() That means first of all it will remove the existing banner and then show a new banner.
                onPressed: () => ScaffoldMessenger.of(context)
                  ..removeCurrentMaterialBanner()
                  ..showMaterialBanner(MaterialBanner(
                      backgroundColor: Colors.green,

                      ///
                      leading:
                          const Icon(Icons.info_outline, color: Colors.white),
                      leadingPadding:
                          const EdgeInsets.symmetric(horizontal: 10),

                      ///
                      content: const Text('Material Banner'),
                      contentTextStyle:
                          const TextStyle(color: Colors.white, fontSize: 17),

                      ///
                      actions: [
                        TextButton(
                            onPressed: () => ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner(),
                            child: const Text('Close',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17))),

                        ///
                        TextButton(
                            onPressed: () async => await Future.delayed(
                                const Duration(seconds: 3),
                                () => ScaffoldMessenger.of(context)
                                    .hideCurrentMaterialBanner()),
                            child: const Text('Close after 3 Seconds',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17))),
                      ])))));
  }
}
