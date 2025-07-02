import 'package:dosytkom/features/PreviousOrder/data/data_source/remote_data_source.dart';
import 'package:dosytkom/features/PreviousOrder/domain/entity/order_payload_entity.dart';

import '../../domain/repository/prev_order_repository.dart';
import '../../domain/entity/prev_order_entitiy.dart';

class PrevOrderRepositoryImpl implements PrevOrderRepository {
  final PrevOrderRemoteDataSource dataSource;

  PrevOrderRepositoryImpl({required this.dataSource});
  @override
  Future<PrevOrderEntity> getPrevOrders({
    required List<OrderPayloadEntity> payload,
    required String resultMessage,
    required bool status,
    String? refNo,
  })async {
    return await dataSource.getPrevOrders(
      payload: payload,
      refNo: refNo,
      resultMessage: resultMessage,
      status: status,
    );
  }
}
