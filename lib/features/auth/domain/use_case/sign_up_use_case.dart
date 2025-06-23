import 'package:dosytkom/features/auth/domain/entity/auth_entity.dart';
import 'package:dosytkom/features/auth/domain/repository/auth_reposotry.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<AuthEntity> call({
    required String firstName,
    required String lastName,
    required String libraryName,
    required int countryId,
    required int cityId,
    required int locationId,
    required String phoneNumber,
    String? secondPhoneNumber,
  }) async {
    print("📦 SignupUseCase.call()");
    print("➡️ countryId: $countryId (${countryId.runtimeType})");
    print("➡️ cityId: $cityId (${cityId.runtimeType})");
    print("➡️ locationId: $locationId (${locationId.runtimeType})");

    return await repository.signUp(
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
