

import 'package:dosytkom/features/auth/data/model/auth_model.dart';

abstract class AuthRepository {
  Future<AuthModel> login({required String phone, required String password});

  
}
