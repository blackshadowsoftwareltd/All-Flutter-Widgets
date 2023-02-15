import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:theme_material_3/helpers/themes/dark.dart' show darkTheme;
import '../providers/theme.dart' show themeProvider;

class ThemeButton extends ConsumerWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Switch(
      value: theme == darkTheme,
      onChanged: (_) => ref.read(themeProvider.notifier).toggle(),
    );
  }
}
