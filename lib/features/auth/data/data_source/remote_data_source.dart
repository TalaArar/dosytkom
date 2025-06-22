
import 'package:dosytkom/core/network/api_client.dart';
import 'package:dosytkom/features/auth/data/model/auth_model.dart';

abstract class RemoteDataSource {
  Future<AuthModel> login({required String phone, required String password});

}

class AuthRemoteDataSource extends RemoteDataSource {
  @override
  Future<AuthModel> login({
    required String phone,
    required String password,
  }) async {
    final response = await ApiClient.postData(
      endpoint: "Login.php",
      body: {"Phone": phone, "Password": password},
      fromJsonT: (data) => AuthModel.fromJson(json: data),
    );
    return response;
  }

}