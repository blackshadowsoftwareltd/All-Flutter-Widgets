import 'package:flutter/material.dart';
import 'second_screen.dart';

void main() => runApp(const MaterialApp(
      home: Home(),
      restorationScopeId: 'root',
    ));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with RestorationMixin {
  @override
  // TODO: implement restorationId
  String? get restorationId => 'home_screen';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // TODO: implement restoreState
    registerForRestoration(firstNameController,
        'first name'); // same method for another controller
    registerForRestoration(
        isBool, 'isChecked'); // same method for another data type or variable
  }

  ///
  RestorableBool isBool = RestorableBool(
      false); // initialization for any type of data type. with constractor
  RestorableTextEditingController firstNameController =
      RestorableTextEditingController(); // initialization any type of controller

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: SizedBox(
          height: 200,
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: firstNameController
                          .value, // firstNameController not support. so >> firstNameController.value
                      decoration:
                          const InputDecoration(hintText: 'first name'))),
              Checkbox(
                  value: isBool.value, // isBool not support. so >> isBool.value

                  onChanged: (newValue) =>
                      setState(() => isBool.value = newValue!)),
              OutlinedButton(
                  child: const Text('Next Screen'),
                  onPressed:
                      () => // to navigat another screen. must need restorablePush navigator
                          Navigator.restorablePush(
                              context, nevigatToSecondScreen)),
              const Text('Tutorial >> Retroportal Studio')
            ],
          ),
        ),
      ),
    );
  }

  static Route<void> nevigatToSecondScreen(context, arguments) =>
      MaterialPageRoute(builder: (conetxt) => const SecondScreen());
}
