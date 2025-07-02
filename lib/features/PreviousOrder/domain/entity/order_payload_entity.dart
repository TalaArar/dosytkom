class OrderPayloadEntity {
  final int orderNo;
  final String? orderStatus;
  final int orderCount;
  final String? orderTime;

  OrderPayloadEntity({
    required this.orderNo,
    this.orderStatus,
    required this.orderCount,
    this.orderTime,
  });

  factory OrderPayloadEntity.fromJson(Map<String, dynamic> json) {
    return OrderPayloadEntity(
      orderNo: json['ORDER_NO'],
      orderStatus: json['ORDER_STATUS'],
      orderCount: json['ORDER_COUNT'],
      orderTime: json['ORDER_TIME'],
    );
  }
}