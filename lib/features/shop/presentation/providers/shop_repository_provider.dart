import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/features/shop/domain/domain.dart';
import '/features/shop/infrastructure/infrastructure.dart';
import '/features/auth/presentation/providers/providers.dart';

final shopRepositoryProvider = Provider<ShopRepository>((ref) {
  final accessToken = ref.watch(authProvider).user?.token ?? '';

  final shopRepository = ShopRepositoryImpl(
      datasourse: ShopDatasourceImpl(accessToken: accessToken));

  return shopRepository;
});
