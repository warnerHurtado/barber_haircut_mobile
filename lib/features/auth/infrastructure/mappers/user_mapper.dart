import 'package:barber_haircut_mobile/features/auth/domain/domain.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
      name: json['name'],
      email: json['email'],
      cellphone: json['cellphone'],
      role: json['role'],
      google: json['google'],
      status: json['status'],
      uid: json['uid'],
      token: json['token']);
}
