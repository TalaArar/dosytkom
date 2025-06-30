import 'package:dosytkom/features/auth/domain/entity/auth_entity.dart';
class AuthModel extends AuthEntity {
  AuthModel({
    
    required super. phone,
  required super. password,
    super.deviceId,
    super.loginToken,
    super.userType,
    required super.status,
    required super.resultMessage,
    super.refNo,
    required super.firstName,
    required super.lastName,
    required super.libraryName,
    required super.countryId,
    required super.cityId,
    required super.locationId,
    required super.phoneNumber,
    super.secondPhoneNumber,
  });

  factory AuthModel.fromJson({required Map<String, dynamic> json}) {
  print("⛏ JSON Received in fromJson: $json");

  return AuthModel(
    phone: json['phone'] ?? '',
    password: json['password'] ?? '',
    deviceId: json['id']?.toString(),
    loginToken: json['loginToken'] ?? '',
    userType: json['userType'] ?? '',
    status: json['status'] ?? false,
    resultMessage: json['resultMessage'] ?? '',
    refNo: json['refNo']?.toString(),
    firstName: json["firsT_NAME"] ?? '',
    lastName: json["lasT_NAME"] ?? '',
    libraryName: json["librarY_NAME"] ?? '',
    countryId: json["librarY_CUNTRY"] ?? 0,
    cityId: json["librarY_CITY"] ?? 0,
    locationId: json["librarY_LOCATION"] ?? 0,
    phoneNumber: json["useR_PHONE_NUMBER"] ?? '',
    secondPhoneNumber: json["librarY_SECOND_PHONE_NUMBER"],
  );
}

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
      'deviceId':'deviceId',
      'loginToken': loginToken,
      'userType': userType,
      'status': status,
      'resultMessage': resultMessage,
      'refNo': refNo,
      "firsT_NAME": firstName,
      "lasT_NAME": lastName,
      "librarY_NAME": libraryName,
      "librarY_CUNTRY": countryId,
      "librarY_CITY": cityId,
      "librarY_LOCATION": locationId,
      "useR_PHONE_NUMBER": phoneNumber,
      "librarY_SECOND_PHONE_NUMBER": secondPhoneNumber,
    };
  }
}
