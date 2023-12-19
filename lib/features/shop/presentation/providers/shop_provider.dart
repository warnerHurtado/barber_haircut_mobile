import 'package:barber_haircut_mobile/features/shop/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain.dart';

final shopProvider = StateNotifierProvider.autoDispose.family<ShopNotifier, ShopState, String>((ref, shopId) {
  final shopsRepository = ref.watch(shopRepositoryProvider);
  
  return ShopNotifier(shopRepository: shopsRepository, shopId: shopId);
});


class ShopNotifier extends StateNotifier<ShopState> {
  final ShopRepository shopRepository;

  ShopNotifier({required this.shopRepository, required String shopId})
      : super(ShopState(id: shopId)) {
    loadShop();
  }

  Future<void> loadShop() async {
    if (state.isLoading || state.isSaving) return;

    state = state.copyWith(isLoading: true);

    final shop = await shopRepository.getShopById(state.id);

    state = state.copyWith(shop: shop, isLoading: false);
  }
}

class ShopState {
  final String id;
  final Shop? shop;
  final bool isLoading;
  final bool isSaving;

  ShopState({
    required this.id,
    this.shop,
    this.isLoading = false,
    this.isSaving = false,
  });

  ShopState copyWith(
          {String? id, Shop? shop, bool? isLoading, bool? isSaving}) =>
      ShopState(
          id: id ?? this.id,
          shop: shop ?? this.shop,
          isLoading: isLoading ?? this.isLoading,
          isSaving: isSaving ?? this.isSaving);
}
