import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/presentation/providers/providers.dart';
import '../../features/shop/presentation/screens/shop_screen.dart';
import '../../features/theme_settings/presentation/screens/theme_settings_screen.dart';
import '../../features/auth/presentation/screens/screens.dart';

import './app_router_notifier.dart';

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: goRouterNotifier,
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),
      GoRoute(path: '/', builder: (context, state) => const ShopScreen()),
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
    redirect: (context, state) {
      final isGoingTo = state.fullPath;
      final authStatus = goRouterNotifier.authStatus;

      if (isGoingTo == '/splash' && authStatus == AuthStatus.checking) {
        return null;
      }

      if (authStatus == AuthStatus.notAuthenticated) {
        if (isGoingTo == '/login' || isGoingTo == '/register') return null;

        return '/login';
      }

      if (authStatus == AuthStatus.authenticated) {
        if (isGoingTo == '/login' ||
            isGoingTo == '/register' ||
            isGoingTo == '/splash') {
          return '/';
        }
      }

      return null;
    },
  );
});
