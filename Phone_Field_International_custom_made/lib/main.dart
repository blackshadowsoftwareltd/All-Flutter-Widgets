import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:international_phone/service_provider.dart';
import 'package:provider/provider.dart';

import 'country_select_dialog.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ServiceProvider>(create: (_) => ServiceProvider())
  ], child: MaterialApp(home: Home())));
}

class Home extends StatelessWidget {
  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ServiceProvider>(context, listen: false);
    final serviceProvider = Provider.of<ServiceProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            child: TextField(
                style: const TextStyle(fontSize: 20),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: const TextStyle(fontSize: 18),
                    prefixIcon: InkWell(
                        onTap: () => showModal(
                            context: context,
                            configuration:
                                const FadeScaleTransitionConfiguration(
                                    barrierColor: Colors.transparent),
                            builder: (context) => CountrySelectDialog()),
                        child: Container(
                            // margin: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            width: 120,
                            height: 50,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      height: 20,
                                      child: Image.asset(
                                          'assets/flags/${serviceProvider.selected.code.toLowerCase()}.png')),
                                  Text('+' + serviceProvider.selected.dialCode,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))
                                ]))),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black38, width: .5),
                        borderRadius: BorderRadius.circular(10))),
                controller: numberController,
                onChanged: (text) =>
                    print('+${provider.selected.dialCode}$text'))));
  }
}
