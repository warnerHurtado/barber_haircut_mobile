import '/config/config.dart';
import '/features/auth/infrastructure/infrastructure.dart';
import '/features/shop/infrastructure/infrastructure.dart';
import 'package:dio/dio.dart';

import '/features/shop/domain/domain.dart';

class ShopDatasourceImpl extends ShopDatasource {
  late final Dio dio;
  final String accessToken;

  ShopDatasourceImpl({required this.accessToken})
      : dio = Dio(BaseOptions(
            baseUrl: Environment.apiUrl, headers: {'x-token': accessToken}));

  @override
  Future<List<Shop>> getShopsByPage({int limit = 10, int skip = 0}) async {
    try {
      final response = await dio.get('/api/companies?limit=$limit&skip=$skip');
      final ShopsResponse shopResponse = ShopsResponse.fromJson(response.data);
      final List<Shop> shops = shopResponse.companies;

      return shops;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw WrongCredentials();
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }
  
  @override
  Future<Shop> getShopById(String id) {
    // TODO: implement getShopById
    throw UnimplementedError();
  }
}
