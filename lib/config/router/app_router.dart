import 'package:barber_haircut_mobile/features/settings/presentation/screens/theme_settings_screen.dart';

import '../../features/auth/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/theme-settings',
      builder: (context, state) => const ThemeSettingsScreen(),
    ),
  ],
);
