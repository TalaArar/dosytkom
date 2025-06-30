import 'package:dosytkom/features/auth/domain/entity/country_entity.dart';

abstract class CountryState {}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountryLoaded extends CountryState {
  final List<CountryEntity> countries;

  CountryLoaded(this.countries);
}

class CountryError extends CountryState {
  final String message;

  CountryError(this.message);
}
