import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    /// 1st
    /// Initial State
    print('initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    /// 2nd
    /// After initState
    /// can be call multiple time
    print('didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant Home oldWidget) {
    super.didUpdateWidget(oldWidget);

    /// 3rd
    /// After initState
    ///
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();

    /// 4th
    ///
    print('deactivate');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    /// 5th
    ///
    print('dispose');
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Lyfecycle'),
      ),
      body: const Center(child: Text('Flutter Lyfecycle')),
    );
  }
}
