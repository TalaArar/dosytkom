import 'package:dosytkom/features/PreviousOrder/domain/entity/order_payload_entity.dart';

import '../entity/prev_order_entitiy.dart';

abstract class PrevOrderRepository {

  Future<PrevOrderEntity> getPrevOrders({ required List<OrderPayloadEntity> payload,
    required String resultMessage,
    required bool status,
    String? refNo,});
}
