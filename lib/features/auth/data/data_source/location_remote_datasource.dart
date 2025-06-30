import 'package:dosytkom/core/network/api_client.dart';
import 'package:dosytkom/features/auth/data/model/country_model.dart';

abstract class LocationRemoteDataSource {
  Future<List<CountryModel>> fetchCountries();
}


class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  @override
  Future<List<CountryModel>> fetchCountries() async {
    final response = await ApiClient.getData(
      endPoint: "GetLocation", 
      fromJsonT: (data) {
        print("🌍 Countries Raw Data: $data");
        final List<dynamic> payload = data['payload'] ?? [];
        return payload.map((e) => CountryModel.fromJson(e)).toList();
      },
    );
    return response;
  }
}
