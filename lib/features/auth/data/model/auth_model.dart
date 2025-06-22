


import 'package:dosytkom/features/auth/domain/entity/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
   required super.phone,
    required super.password,
    
  });

  factory AuthModel.fromJson({required Map<String, dynamic> json}) {
    return AuthModel(
      phone: json['phone'],
      password: json['password'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
    };
  }
}
