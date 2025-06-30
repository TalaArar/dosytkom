import 'package:dosytkom/features/auth/data/data_source/country_remote_datasource.dart';
import 'package:dosytkom/features/auth/data/model/country_model.dart';


class LocationRepositoryImpl implements CountryRemoteDatasource {
  final CountryRemoteDatasource remoteDataSource;

  LocationRepositoryImpl(this.remoteDataSource);

  @override
  Future<CountryModel> fetchCountries() async {
    return await CountryRemoteDatasourceImpl().fetchCountries();
  }
}
