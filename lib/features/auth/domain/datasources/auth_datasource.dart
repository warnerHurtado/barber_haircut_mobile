//! DENITION OF WHAT I WANT THE AUTHENTICATION SYSTEM TO BE

import '../entities/user.dart';

abstract class  AuthDatasourse {

  Future<User> login(String name, String password);
  Future<User> register(String name, String password, String email, String cellphone);
  Future<User> chekAuthStatus();
}