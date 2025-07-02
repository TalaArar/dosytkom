import 'package:dosytkom/features/PreviousOrder/domain/entity/order_payload_entity.dart';
import 'package:dosytkom/features/PreviousOrder/domain/entity/prev_order_entitiy.dart';
import 'package:equatable/equatable.dart';

abstract class PrevOrderState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PrevOrderInitial extends PrevOrderState {}

class PrevOrderLoading extends PrevOrderState {}

class PrevOrderLoaded extends PrevOrderState {
  final List<OrderPayloadEntity> orders;
   PrevOrderLoaded(this.orders);

  @override
  List<Object?> get props => [orders];
}

class PrevOrderError extends PrevOrderState {
  final String message;
   PrevOrderError(this.message);

  @override
  List<Object?> get props => [message];
}
