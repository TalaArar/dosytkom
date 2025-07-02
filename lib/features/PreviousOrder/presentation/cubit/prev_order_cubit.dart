import 'package:dosytkom/features/NewOrder/presentation/cubit/newOrderCubit.dart';
import 'package:dosytkom/features/PreviousOrder/domain/entity/order_payload_entity.dart';
import 'package:dosytkom/features/PreviousOrder/domain/entity/prev_order_entitiy.dart';
import 'package:dosytkom/features/PreviousOrder/domain/repository/prev_order_repository.dart';
import 'package:dosytkom/features/PreviousOrder/presentation/state/prev_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class PrevOrderCubit extends Cubit<PrevOrderState> {
  final PrevOrderRepository _repository;

  PrevOrderCubit(this._repository) : super(PrevOrderInitial());

  Future<void> getPrevOrders({
    required List<OrderPayloadEntity> payload,
    required bool status,
    required String resultMessage,
    String? refNo,
  }) async {
    emit(PrevOrderLoading());
    try {
      final response = await _repository.getPrevOrders(
        payload: payload,
        status: status,
        resultMessage: resultMessage,
        refNo: refNo,
      );
      if (response.status == true) {
        emit(PrevOrderLoaded(response.payload));
      } else {
        emit(PrevOrderError(response.resultMessage));
      }
    } catch (e) {
      emit(PrevOrderError(e.toString()));
    }
  }
}
