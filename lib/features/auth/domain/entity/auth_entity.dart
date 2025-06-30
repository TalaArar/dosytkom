class AuthEntity {
  
  final String phone;
  final String password;
  final String? deviceId;
  final String? loginToken;
  final String? userType;
  final bool status;
  final String resultMessage;
  final String? refNo;
  final String? firstName;
  final String? lastName;
  final String? libraryName;
  final int? countryId;
  final int? cityId;
  final int? locationId;
  final String? phoneNumber;
  final String? secondPhoneNumber;

  AuthEntity({
   
    required this.phone,
    required this.password,
   this.deviceId,
    this.loginToken,
    this.userType,
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
