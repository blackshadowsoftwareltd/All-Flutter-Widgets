import 'package:flutter/material.dart';

class TextButtons extends StatelessWidget {
  const TextButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Text Buttons'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(onPressed: () {}, child: const Text('Button')),
            TextButton.icon(
              onPressed: () {},
              label: const Text('Add'),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
