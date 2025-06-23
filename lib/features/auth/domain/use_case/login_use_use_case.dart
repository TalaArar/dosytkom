import 'package:dosytkom/features/auth/domain/entity/auth_entity.dart';
import 'package:dosytkom/features/auth/domain/repository/auth_reposotry.dart';

class LoginUseCase {
  final AuthRepository authReposotry;

  LoginUseCase(this.authReposotry);

  Future<AuthEntity> call({required String phone, required String password}) async {
    return await authReposotry.login(phone: phone, password: password);
  }
}
