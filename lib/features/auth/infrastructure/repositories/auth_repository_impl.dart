import 'package:barber_haircut_mobile/features/auth/domain/domain.dart';
import 'package:barber_haircut_mobile/features/auth/infrastructure/infrastructure.dart';

class AuthRepositoryImp extends AuthRepository {
  final AuthDatasourse datasourse;

  AuthRepositoryImp({AuthDatasourse? datasourse})
      : datasourse = datasourse ?? AuthDataSourceImp();

  @override
  Future<User> checkAuthStatus(String token) {
    return datasourse.checkAuthStatus(token);
  }

  @override
  Future<User> login(String name, String password) {
    return datasourse.login(name, password);
  }

  @override
  Future<User> register(
      String name, String password, String email, String cellphone) {
    return datasourse.register(name, password, email, cellphone);
  }
}
