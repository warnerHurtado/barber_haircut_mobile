import '../entities/user.dart';

abstract class  AuthRepository {

  Future<User> login(String name, String password);
  Future<User> register(String name, String password, String email, String cellphone);
  Future<User> chekAuthStatus();
}