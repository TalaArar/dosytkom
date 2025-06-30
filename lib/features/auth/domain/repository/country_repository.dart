import 'package:dosytkom/features/auth/data/model/country_model.dart';

abstract class CountryRepository {
     Future<List<CountryModel>> fetchCountries();

}