


import 'package:dosytkom/features/auth/data/model/auth_model.dart';
import 'package:dosytkom/features/auth/domain/repository/auth_reposotry.dart';

class LoginUseCase {
  AuthRepository authReposotry;

  LoginUseCase(this.authReposotry);

  Future<AuthModel> call({required String phone, required String password}) async {
    return await authReposotry.login(phone: phone, password: password);
  }
}
