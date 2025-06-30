// features/NewOrder/presentation/cubit/new_order_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dosytkom/features/NewOrder/presentation/state/newOrder_state.dart';
import '../../domain/repository/newOrderrepository.dart';

class NewOrderCubit extends Cubit<NewOrderState> {
  final NewOrderRequestRepository _repository;

  NewOrderCubit(this._repository) : super(NewOrderInitialState());

  Future<void> createOrder({
    required String dosyahName,
    required int dosyahCount,
    required int orderAcceptance,
    required String libraryName,
    required String libraryPhoneNumber,
    required int orderLocation,
  }) async {
    emit(NewOrderLoadingState());

    try {
      final response = await _repository.newOrder(
        dosyahName:        dosyahName,
        dosyahCount:       dosyahCount,
        orderAcceptance:   orderAcceptance,
        libraryName:       libraryName,
        libraryPhoneNumber: libraryPhoneNumber,
        orderLocation:     orderLocation,
      );

      
      if (response.status == true) {
        emit(
          NewOrderSuccessState(
            response.message ?? 'تم إنشاء الطلب بنجاح',
          ),
        );
      }
      else {
        emit(
          NewOrderErrorState(
            response.errorMessage ?? 'فشلت العملية، حاول مرة أخرى',
          ),
        );
      }
    } catch (e) {
      emit(NewOrderErrorState(e.toString()));
    }
  }
}
