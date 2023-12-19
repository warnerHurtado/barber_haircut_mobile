import '/features/shop/domain/domain.dart';

class ShopRepositoryImpl extends ShopRepository {
  final ShopDatasource datasourse;

  ShopRepositoryImpl({required this.datasourse});

  @override
  Future<List<Shop>> getShopsByPage({int limit = 10, int skip = 0}) {
    return datasourse.getShopsByPage(limit: limit, skip: skip);
  }

  @override
  Future<Shop> getShopById(String id) {
    return datasourse.getShopById(id);
  }
}
