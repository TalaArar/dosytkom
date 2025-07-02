import 'package:dosytkom/features/PreviousOrder/data/model/order_payload_model.dart';
import 'package:dosytkom/features/PreviousOrder/domain/entity/order_payload_entity.dart';
import 'package:dosytkom/features/PreviousOrder/domain/entity/prev_order_entitiy.dart';

class PrevOrderModel extends PrevOrderEntity {
  const PrevOrderModel({
    required super. payload,
    required super.status,
    required super. resultMessage,
    super. refNo,
  }) ;

  factory PrevOrderModel.fromJson({required Map<String, dynamic> json}) {
  return PrevOrderModel(
    payload: (json['payload'] as List)
        .map((e) => OrderPayloadEntity.fromJson(e))
        .toList(),
    status: json['status'] as bool,
    resultMessage: json['resultMessage'] as String,
    refNo: json['refNo'] as String?,
  );
}
}
