class EducationalItem {
  final int id;
  final String name;

  EducationalItem({required this.id, required this.name});

  factory EducationalItem.fromJson(Map<String, dynamic> json) {
    return EducationalItem(
      id: json['EDUCATIONAL_ITEMS_NO'],
      name: json['EDUCATIONAL_ITEMS_NAME'],
    );
  }
}
