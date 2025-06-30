import 'package:dosytkom/features/auth/data/model/country_model.dart';

class CountryEntity {
  final String id;
  final String name;
  final List<Country> countries;
  final bool status;
  final String resultMessage;

  CountryEntity({
    required this.id,
    required this.name,
    required this.countries,
    required this.status,
    required this.resultMessage,
  });
}
