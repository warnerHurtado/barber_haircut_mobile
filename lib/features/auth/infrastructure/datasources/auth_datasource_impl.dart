import 'package:dio/dio.dart';

import 'package:barber_haircut_mobile/config/config.dart';
import 'package:barber_haircut_mobile/features/auth/domain/domain.dart';
import 'package:barber_haircut_mobile/features/auth/infrastructure/infrastructure.dart';

class AuthDataSourceImp extends AuthDatasourse {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.apiUrl,
  ));

  @override
  Future<User> chekAuthStatus() {
    // TODO: implement chekAuthStatus
    throw UnimplementedError();
  }

  @override
  Future<User> login(String name, String password) async {
    try {
           final response = await dio
          .post('/api/auth/login', data: {'email': name, 'password': password});

      final Map<String, dynamic> userMap = {
        ...response.data['user'],
        'token': response.data['token']
      };

      final user = UserMapper.userJsonToEntity(userMap);

      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw WrongCredentials();
      } 

      if (e.type == DioExceptionType.connectionTimeout) {
        throw ConnectionTimeout();
      }

      throw NextworkError();
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<User> register(
      String name, String password, String email, String cellphone) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
