import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));
final ValueNotifier<int> count = ValueNotifier<int>(0);
void incriment() {
  count.value++;
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder<int>(
          valueListenable: count,
          builder: (context, data, _) => Text(
            data.toString(),
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
      floatingActionButton:
          FloatingActionButton.small(onPressed: () => incriment()),
    );
  }
}
