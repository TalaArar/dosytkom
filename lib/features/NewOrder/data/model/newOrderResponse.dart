import 'package:dosytkom/features/NewOrder/domain/Entity/newOrderRseponse.dart';

class NewOrderResponseModel extends OrderResponseEntity {
  NewOrderResponseModel({
    required super.status,
    required super.resultMessage,
    super.refNo,
  });

  factory NewOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return NewOrderResponseModel(
      status: json['status'] == true,
      resultMessage: json['resultMessage'] ?? '',
      refNo: json['refNo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'resultMessage': resultMessage, 'refNo': refNo};
  }
}
