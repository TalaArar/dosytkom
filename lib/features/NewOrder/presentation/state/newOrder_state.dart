// features/NewOrder/presentation/state/new_order_state.dart
import 'package:equatable/equatable.dart';

abstract class NewOrderState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewOrderInitialState extends NewOrderState {}

class NewOrderLoadingState extends NewOrderState {}

class NewOrderSuccessState extends NewOrderState {
  final String message;
  NewOrderSuccessState(this.message);

  @override
  List<Object?> get props => [message];
}

class NewOrderErrorState extends NewOrderState {
  final String errorMessage;
  NewOrderErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
