class AuthEntity {
  final String userName;
  final String ?userType;
  final String ?loginToken;
  final String? password;
  final bool ?status;
  final String resultMessage;
  final String? refNo;
    final String? firstName;
  final String ?lastName;
  final String? libraryName;
  final int ?countryId;
  final int ?cityId;
  final int ?locationId;
  final String? phoneNumber;
  final String? secondPhoneNumber;

  AuthEntity({
    required this.userName,
    required this.userType,
    required this.loginToken,
    required this.password,
    required this.status,
    required this.resultMessage,
    required this.refNo,
      this.firstName,
     this.lastName,
     this.libraryName,
     this.countryId,
     this.cityId,
     this.locationId,
     this.phoneNumber,
    this.secondPhoneNumber,
  });
}
