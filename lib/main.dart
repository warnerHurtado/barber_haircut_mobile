import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:barber_haircut_mobile/features/theme_settings/presentation/providers/theme_provider.dart';
import './config/config.dart';

void main() async {
  await Environment.initEnvironment();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppTheme appTheme = ref.watch(appThemeProvider);
    final appRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
      title: 'Barber Haircut',
      routerConfig: appRouter,
    );
  }
}
