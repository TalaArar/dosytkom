import 'package:dosytkom/core/network/api_client.dart';
import 'package:dosytkom/features/auth/data/model/country_model.dart';
import 'package:flutter/cupertino.dart';

abstract class CountryRemoteDatasource {
  Future<CountryModel> fetchCountries();
}

class CountryRemoteDatasourceImpl implements CountryRemoteDatasource {
  @override
  Future<CountryModel> fetchCountries() async {
    final response = await ApiClient.getData(
      endPoint: "GetCountry?lang=1",
      fromJsonT: (data) {
        debugPrint("🌍 Country Raw Data: $data");
        final payload = data['payload'] ?? [];
        return payload.map((e) => CountryModel.fromJson(e)).toList();
      },
    );
    return response;
  }
}
