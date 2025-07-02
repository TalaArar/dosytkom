import 'package:dosytkom/core/network/api_client.dart';
import 'package:dosytkom/features/PreviousOrder/data/model/prev_order_model.dart';
import 'package:dosytkom/features/PreviousOrder/domain/entity/order_payload_entity.dart';
import 'package:dosytkom/features/PreviousOrder/domain/entity/prev_order_entitiy.dart';

abstract class PrevOrderRemoteDataSource {
  Future<PrevOrderModel> getPrevOrders({required List<OrderPayloadEntity> payload, String? refNo, required String resultMessage, required bool status });
}

class PrevOrderRemoteDataSourceImpl implements PrevOrderRemoteDataSource {
  @override
  Future<PrevOrderModel> getPrevOrders({
    required List<OrderPayloadEntity> payload,
    required bool status,
    required String resultMessage,
     String? refNo,
  }) async {
    final response = await ApiClient.getData(
      endPoint: "GetpreviusLibraryOrders",

      fromJsonT: (data) {
        print("⛏ JSON Received in fromJson: $data");
        return PrevOrderModel.fromJson(json: data);
      },
    );

    return response;
  }
}
