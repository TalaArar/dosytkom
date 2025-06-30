import 'package:dosytkom/features/auth/domain/entity/auth_entity.dart';
import 'package:dosytkom/features/auth/domain/repository/auth_reposotry.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<AuthEntity> call({required String phone, required String password}) {
    return repository.login(phone: phone, password: password);
  }
}
