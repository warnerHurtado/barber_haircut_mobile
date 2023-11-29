import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/features/shop/domain/domain.dart';
import '/features/shop/presentation/providers/providers.dart';

final shopsProvider = StateNotifierProvider<ShopsNotifier, ShopsState>((ref) {
  final shopsRepository = ref.watch( shopRepositoryProvider );

  return ShopsNotifier(shopsRepository: shopsRepository);
});

class ShopsNotifier extends StateNotifier<ShopsState> {
  final ShopRepository shopsRepository;

  ShopsNotifier({required this.shopsRepository}) : super(ShopsState()) {
    loadNextPage();
  }

  Future loadNextPage() async {
    if (state.isLoading || state.isLastPage) return;

    state = state.copyWith(isLoading: true);

    final shops = await shopsRepository.getShopsByPage(
        limit: state.limit, skip: state.skip);

    if (shops.isEmpty) {
      state = state.copyWith(isLoading: false, isLastPage: true);
      return;
    }
    state = state.copyWith(
        isLastPage: false,
        isLoading: false,
        skip: state.skip + 10,
        shops: [...state.shops, ...shops]);
  }
}

class ShopsState {
  final bool isLastPage;
  final int limit;
  final int skip;
  final bool isLoading;
  final List<Shop> shops;

  ShopsState(
      {this.isLastPage = false,
      this.limit = 10,
      this.skip = 0,
      this.isLoading = false,
      this.shops = const []});

  ShopsState copyWith({
    bool? isLastPage,
    int? limit,
    int? skip,
    bool? isLoading,
    List<Shop>? shops,
  }) =>
      ShopsState(
        isLastPage: isLastPage ?? this.isLastPage,
        limit: limit ?? this.limit,
        skip: skip ?? this.skip,
        isLoading: isLoading ?? this.isLoading,
        shops: shops ?? this.shops,
      );
}
