import 'package:dosytkom/features/PreviousOrder/domain/entity/order_payload_entity.dart';

class OrderPayloadModel extends OrderPayloadEntity {
   OrderPayloadModel({
    required super. orderNo,
    super. orderStatus,
    required super.orderCount,
    String? orderTime,
  });

  factory OrderPayloadModel.fromJson(Map<String, dynamic> json) {
    return OrderPayloadModel(
      orderNo: json['ORDER_NO'] ?? 0,
      orderStatus: json['ORDER_STATUS'],
      orderCount: json['ORDER_COUNT'] ?? 0,
      orderTime: json['ORDER_TIME'],
    );

  }

  Map<String,dynamic>toJson(){
    return {
      'ORDER_NO': orderNo,
      'ORDER_STATUS': orderStatus,
      'ORDER_COUNT': orderCount,
      'ORDER_TIME': orderTime,
  };
  }
}
