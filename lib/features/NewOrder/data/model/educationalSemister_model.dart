class EducationalSemister {
  final int id;
  final String name;

  EducationalSemister({
    required this.id,
    required this.name,
  });

  factory EducationalSemister.fromJson(Map<String, dynamic> json) {
    return EducationalSemister(
      id:   json['EDUCATIONAL_SEMISTER_NO'],
      name: json['EDUCATIONAL_SEMISTER_NAME'],
    );
  }
}
