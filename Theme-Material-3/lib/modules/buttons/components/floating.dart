import 'package:flutter/material.dart';

class FloatingActionButtons extends StatelessWidget {
  const FloatingActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Floating Action Buttons'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton.small(
              heroTag: 'small',
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
                heroTag: 'normal',
                onPressed: () {},
                child: const Icon(Icons.add)),
            FloatingActionButton.extended(
              heroTag: 'extended',
              onPressed: () {},
              label: const Text('Button'),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
