
import 'package:dosytkom/features/PreviousOrder/domain/entity/order_payload_entity.dart';

class PrevOrderEntity {
  final List<OrderPayloadEntity> payload;
  final bool status;
  final String resultMessage;
  final String? refNo;

  const PrevOrderEntity({
    required this.payload,
    required this.status,
    required this.resultMessage,
    this.refNo,
  });
}
