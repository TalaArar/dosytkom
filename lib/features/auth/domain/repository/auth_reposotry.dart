

import 'package:dosytkom/features/auth/domain/entity/auth_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> login({required String phone, required String password});
   Future<AuthEntity> signUp({
    required String firstName,
    required String lastName,
    required String libraryName,
    required int countryId,
    required int cityId,
    required int locationId,
    required String phoneNumber,
    String? secondPhoneNumber,
  });

  
}
