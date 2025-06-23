import 'dart:ffi';

import 'package:dosytkom/core/network/api_client.dart';
import 'package:dosytkom/features/auth/data/model/auth_model.dart';

abstract class RemoteDataSource {
  Future<AuthModel> login({required String phone, required String password});
  Future<AuthModel> signUp({
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

class AuthRemoteDataSource implements RemoteDataSource {
  @override
  Future<AuthModel> login({
    required String phone,
    required String password,
  }) async {
    final response = await ApiClient.postData(
      endpoint: "LoginSystem",
      body: {"userName": phone, "password": password},
      fromJsonT: (data) => AuthModel.fromJson(json: data),
    );
    return response;
  }

  @override
Future<AuthModel> signUp({
  required String firstName,
  required String lastName,
  required String libraryName,
  required int countryId,
  required int cityId,
  required int locationId,
  required String phoneNumber,
  String? secondPhoneNumber,
}) async {
  final requestBody = {
    "firsT_NAME": firstName,
    "lasT_NAME": lastName,
    "librarY_NAME": libraryName,
    "librarY_CUNTRY": countryId,
    "librarY_CITY": cityId,
    "librarY_LOCATION": locationId,
    "useR_PHONE_NUMBER":  phoneNumber,
    "librarY_SECOND_PHONE_NUMBER": secondPhoneNumber ?? "",
  };

  print("📤 Sending SignUp Request:");
  print(requestBody);

  final response = await ApiClient.postData(
    endpoint: "CreateNewLibrary",
    body: requestBody,
    fromJsonT: (data) {
      print("📥 Raw Response Data: $data");
      return AuthModel.fromJson(json: data);
    },
  );

  print("✅ Finished SignUp Successfully");
  return response;
}
}