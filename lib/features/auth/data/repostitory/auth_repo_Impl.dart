


import 'package:dosytkom/features/auth/data/data_source/remote_data_source.dart';
import 'package:dosytkom/features/auth/data/model/auth_model.dart';
import 'package:dosytkom/features/auth/domain/repository/auth_reposotry.dart';

class AuthRepoImpl extends AuthRepository {
  final AuthRemoteDataSource dataSource;

  AuthRepoImpl({required this.dataSource});

  

  @override
  Future<AuthModel> login({
    required String phone,
    required String password,
  }) async {
    return await dataSource.login(phone: phone, password: password);
  }

  
}
