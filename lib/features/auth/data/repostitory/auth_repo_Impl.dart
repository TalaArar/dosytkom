import 'package:dosytkom/features/auth/data/data_source/remote_data_source.dart';
import 'package:dosytkom/features/auth/data/model/auth_model.dart';
import 'package:dosytkom/features/auth/domain/entity/auth_entity.dart';
import 'package:dosytkom/features/auth/domain/repository/auth_reposotry.dart';

class AuthRepoImpl extends AuthRepository {
  final AuthRemoteDataSource dataSource;

  AuthRepoImpl({required this.dataSource});

  @override
  Future<AuthEntity> login({required String phone, required String password}) {
    return dataSource.login(phone: phone, password: password);
  }

  @override
  Future<AuthEntity> signUp({
    required String firstName,
    required String lastName,
    required String libraryName,
    required int countryId,
    required int cityId,
    required int locationId,
    required String phoneNumber,
    String? secondPhoneNumber,
  }) async {
    return await dataSource.signUp(
      firstName: firstName,
      lastName: lastName,
      libraryName: libraryName,
      countryId: countryId,
      cityId: cityId,
      locationId: locationId,
      phoneNumber: phoneNumber,
      secondPhoneNumber: secondPhoneNumber,
    );
  }
}
