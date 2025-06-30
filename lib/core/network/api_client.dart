import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utl/constant_values.dart';

class ApiClient<T> {
 
  static Future<T> getData<T>({
  required String endPoint,
  T Function(dynamic data)? fromJsonT,
  Map<String, String>? queryParams,
  Map<String, String>? headers, // ✅ أضفنا هذا
}) async {
  final uri = Uri.parse("${ConstantValues.baseUrl}$endPoint")
      .replace(queryParameters: queryParams);

  print("📤 GET: $uri");

  final response = await http.get(
    uri,
    headers: headers, 
  );

  if (response.statusCode == 200) {
    var jsonBody = jsonDecode(response.body);
    return fromJsonT!(jsonBody);
  } else {
    throw Exception("Something went wrong");
  }
}


  static Future<List<T>> getDataList<T>({
    required String endPoint,
    T Function(dynamic data)? fromJsonT,
  }) async {
    final response = await http.get(
      Uri.parse("${ConstantValues.baseUrl}$endPoint"),
    );

    print("${ConstantValues.baseUrl}$endPoint");
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var data = jsonBody['data'];

      List<T> list = [];
      for (var item in data) {
        list.add(fromJsonT!(item));
      }
      return list;
    } else {
      throw Exception("Something went wrong");
    }
  }

  static Future<T> postData<T>({
    required String endpoint,
    T Function(dynamic data)? fromJsonT,
    required Map<String, dynamic> body,
  }) async {
    final response = await http.post(
      Uri.parse("${ConstantValues.baseUrl}$endpoint"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    print("📤 POST to: ${ConstantValues.baseUrl}$endpoint");
    print("📦 Body: ${jsonEncode(body)}");
    print("📥 Status Code: ${response.statusCode}");
    print("📩 Response Body: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      final jsonBody = jsonDecode(response.body);

      if (jsonBody is Map<String, dynamic> && jsonBody.containsKey('status')) {
        if (jsonBody['status'] == false) {
          final message =
              (jsonBody['resultMessage'] != null &&
                  jsonBody['resultMessage'].toString().trim().isNotEmpty)
              ? jsonBody['resultMessage']
              : 'فشل في العملية، الرجاء المحاولة لاحقًا';
          print("❌ API Returned Error: $message");
          throw Exception(message);
        }
      }

      return fromJsonT!(jsonBody);
    } else {
      throw Exception(
        "Something went wrong: ${response.statusCode} - ${response.body}",
      );
    }
  }

  static Future<T> putData<T>({
    required String endpoint,
    T Function(dynamic data)? fromJsonT,
    required Map<String, dynamic> body,
  }) async {
    final response = await http.put(
      Uri.parse("${ConstantValues.baseUrl}$endpoint"),
      body: jsonEncode(body),
      headers: {'Content-type': 'application/json; charset=UTF-8'},
    );

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      return fromJsonT!(jsonBody);
    } else {
      throw Exception("Something went wrong");
    }
  }

  static Future<bool> deleteData({required String endpoint}) async {
    final response = await http.delete(
      Uri.parse("${ConstantValues.baseUrl}$endpoint"),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<T> postMultiPartData<T>({
    required Map<String, String> fields,
    required String endpoint,
    required List<http.MultipartFile> files,
    required T Function(dynamic data) fromJsonT,
  }) async {
    try {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse("${ConstantValues.baseUrl}$endpoint"),
      );

      for (var field in fields.entries) {
        var key = field.key;
        var value = field.value;
        request.fields[key] = value;
      }

      for (http.MultipartFile file in files) {
        request.files.add(file);
      }

      final response = await http.Response.fromStream(await request.send());

      print("response.body = ${response.body} ");

      if (response.statusCode == 200) {
        final String decodedResponse = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedResponse);
        return fromJsonT(data);
      } else {
        throw Exception("Something went wrong");
      }
    } catch (error) {
      throw Exception("Something went wrong");
    }
  }
}
