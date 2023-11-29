import 'package:barber_haircut_mobile/features/shop/domain/entities/shop.dart';

abstract class ShopDatasource {
  Future<List<Shop>> getShopsByPage({int limit = 10, int skip = 0});
}
