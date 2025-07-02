import 'package:dosytkom/features/NewOrder/data/model/educationalItem_model.dart';

class EducationalItemsResponse {
  final List<EducationalItem> payload;
  final bool status;
  final String resultMessage;

  EducationalItemsResponse({
    required this.payload,
    required this.status,
    required this.resultMessage,
  });

  factory EducationalItemsResponse.fromJson(Map<String, dynamic> json) {
    var list = json['payload'] as List;
    List<EducationalItem> items = list.map((i) => EducationalItem.fromJson(i)).toList();

    return EducationalItemsResponse(
      payload: items,
      status: json['status'],
      resultMessage: json['resultMessage'],
    );
  }
}
