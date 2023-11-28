import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';

import '/features/auth/presentation/providers/providers.dart';

class CheckAuthStatusScreen extends ConsumerWidget {
  const CheckAuthStatusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(authProvider.notifier).checkAuthStatus();

    return FadeInUp(
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}