class EducationalLevel {
  final int id;
  final String name;

  EducationalLevel({
    required this.id,
    required this.name,
  });

  factory EducationalLevel.fromJson(Map<String, dynamic> json) {
    return EducationalLevel(
      id: json['EDUCATIONAL_LEVEL_NO'],
      name: json['EDUCATIONAL_LEVEL_NAME'],
    );
  }
}
