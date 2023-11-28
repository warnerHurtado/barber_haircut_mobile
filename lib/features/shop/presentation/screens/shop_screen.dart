import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/features/auth/presentation/providers/auth_provider.dart';
import '/features/shared/shared.dart';

class ShopScreen extends ConsumerStatefulWidget {
  const ShopScreen({super.key});

  @override
  ShopScreenState createState() => ShopScreenState();
}

class ShopScreenState extends ConsumerState<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return GeneralMenus(
      body: Scaffold(
        body: Center(
          child: FloatingActionButton(
            onPressed: () {
              ref.read(authProvider.notifier).logout('');
            },
            child: const Text('Logout'),
          ),
        ),
      ),
    );
  }
}
