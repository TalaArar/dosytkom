import 'package:dosytkom/features/auth/data/model/country_model.dart';
import 'package:dosytkom/features/auth/domain/entity/country_entity.dart';
import 'package:dosytkom/features/auth/domain/repository/country_repository.dart';

class FetchCountriesUseCase {
  final CountryRepository repository;

  FetchCountriesUseCase(this.repository);

  Future<List<CountryModel>> call() {
    return repository.fetchCountries();
  }
}
