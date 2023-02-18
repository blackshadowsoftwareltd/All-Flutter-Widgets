import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_material_3/modules/providers/theme.dart';

class IconButtons extends ConsumerWidget {
  const IconButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Icon Buttons'),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.all_inclusive),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.all_inclusive),
              style: IconButton.styleFrom(
                shape: StadiumBorder(
                    side: BorderSide(
                        color: theme.colorScheme.onTertiary, width: 1)),
                backgroundColor: theme.colorScheme.primary.withOpacity(.2),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
