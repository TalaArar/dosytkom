import 'package:dosytkom/features/auth/domain/entity/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.userName,
    super.userType,
    super.loginToken,
    required super.password,
    super.status,
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
      userName: json['userName']?.toString() ?? '',
      userType: json['userType']?.toString(),
      loginToken: json['loginToken']?.toString(),
      password: json['password']?.toString(),
      status: json['status'] == true,
      resultMessage: json['resultMessage']?.toString() ?? '',
      refNo: json['refNo']?.toString(),
       firstName: json["firsT_NAME"],
      lastName: json["lasT_NAME"],
      libraryName: json["librarY_NAME"],
      countryId: json["librarY_CUNTRY"],
      cityId: json["librarY_CITY"],
      locationId: json["librarY_LOCATION"],
      phoneNumber: json["useR_PHONE_NUMBER"],
      secondPhoneNumber: json["librarY_SECOND_PHONE_NUMBER"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userType': userType,
      'loginToken': loginToken,
      'password': password,
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
