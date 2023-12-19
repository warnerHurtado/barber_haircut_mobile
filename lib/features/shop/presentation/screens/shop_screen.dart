import 'package:barber_haircut_mobile/features/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class ShopScreen extends ConsumerWidget {
  final String shopId;

  const ShopScreen({super.key, required this.shopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopState = ref.watch(shopProvider(shopId));

    return GeneralMenus(
      body: shopState.isLoading
          ? const FullScreenLoader()
          : Scaffold(
              appBar: AppBar(
                title: Text('${shopState.shop?.name}'),
                actions: const [],
              ),
              body: Center(
                child: Text('BARBER VIEW: ${shopState.shop?.name}'),
              ),
            ),
    );
  }
}
