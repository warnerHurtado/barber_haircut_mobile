import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:barber_haircut_mobile/features/settings/presentation/providers/theme_provider.dart';
import 'package:go_router/go_router.dart';

class ThemeSettingsScreen extends ConsumerWidget {
  const ThemeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final bool isDarkMode = ref.watch(isDarkModeProvider);
    final bool isDarkMode = ref.watch(appThemeProvider).isDarkMode;

    return Center(
      child: Scaffold(
        appBar: AppBar(title: const Text('the AppBar'), actions: [
          IconButton(
              onPressed: () {
                // ref
                //     .read(isDarkModeProvider.notifier)
                //     .update((state) => !state);
                ref.read(appThemeProvider.notifier).toggleDarkMode();
              },
              icon: isDarkMode
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined)),
        ]),
        body: GestureDetector(
          onTap: () => context.go('/login'),
          child: const Text('Login')),
        drawer: Container(),
        endDrawer: Container(),
      ),
    );
  }
}
