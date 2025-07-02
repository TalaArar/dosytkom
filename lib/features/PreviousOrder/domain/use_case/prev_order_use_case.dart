import 'package:dosytkom/features/PreviousOrder/domain/entity/order_payload_entity.dart';
import 'package:dosytkom/features/PreviousOrder/domain/entity/prev_order_entitiy.dart';
import 'package:dosytkom/features/PreviousOrder/domain/repository/prev_order_repository.dart';

class PrevOrderUseCase {
  final PrevOrderRepository repository;
  PrevOrderUseCase( this.repository);

  Future<PrevOrderEntity>call({
  required List<OrderPayloadEntity> payload,
  required bool status,
  required String resultMessage,
  required String? refNo,
  })async{
     print("📦 PrevOrderUseCase.call()");
    print("➡️ payload: $payload (${payload.runtimeType})");
    print("➡️ status: $status (${status.runtimeType})");
    print("➡️ resultMessage: $resultMessage (${resultMessage.runtimeType})");
    print("➡️ refNo: $refNo (${refNo.runtimeType})");
    
    return await repository.getPrevOrders(
      payload: payload, 
      resultMessage: resultMessage, 
      status: status,
      refNo: refNo,
      );
  }
}