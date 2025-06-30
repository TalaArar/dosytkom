import 'package:dosytkom/features/auth/domain/entity/country_entity.dart';

abstract class LocationRepository {
  Future<List<CountryEntity>> fetchCountries();
}
