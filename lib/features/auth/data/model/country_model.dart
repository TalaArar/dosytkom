import 'package:dosytkom/features/auth/domain/entity/country_entity.dart';

class CountryModel extends CountryEntity {
  CountryModel({
    required super.id,
    required super.name,
    required List<Country> countries,
    required bool status,
    required String resultMessage,
  }) : super(
          
          countries: countries,
          status: status,
          resultMessage: resultMessage,
        );

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      countries: (json['payload'] as List<dynamic>)
          .map((e) => Country.fromJson(e))
          .toList(),
      status: json['status'] ?? false,
      resultMessage: json['resultMessage'] ?? '',
      id: json['id']??'',
      name: json['name']??'',
    );
  }
}

class Country {
  final int id;
  final String name;

  Country({
    required this.id,
    required this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['COUNTRY_NO'],
      name: json['COUNTRY_NAME'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'COUNTRY_NO': id,
      'COUNTRY_NAME': name,
    };
  }

  @override
  String toString() => name;
}
