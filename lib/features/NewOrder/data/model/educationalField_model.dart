class EducationalField {
  final int id;
  final String name;

  EducationalField({
    required this.id,
    required this.name,
  });

  factory EducationalField.fromJson(Map<String, dynamic> json) {
    return EducationalField(
      id:   json['EDUCATIONAL_FIELD_NO'],
      name: json['EDUCATIONAL_FIELD_NAME'],
    );
  }
}
