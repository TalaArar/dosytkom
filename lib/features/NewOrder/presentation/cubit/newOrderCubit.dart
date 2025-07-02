// features/NewOrder/presentation/cubit/new_order_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:dosytkom/features/NewOrder/data/model/educationalItem_model.dart';
import 'package:dosytkom/features/NewOrder/presentation/state/newOrder_state.dart';
import '../../domain/repository/newOrderrepository.dart';

class NewOrderCubit extends Cubit<NewOrderState> {
  final NewOrderRequestRepository _repository;

  NewOrderCubit(this._repository) : super(NewOrderInitialState());

  // دالة إنشاء الطلب
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
      } else {
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

  // دالة جلب المواد التعليمية
  Future<void> fetchEducationalItems() async {
    emit(EducationalItemsLoadingState());

    try {
      final List<EducationalItem> items = await _repository.getEducationalItems();
      emit(EducationalItemsLoadedState(items));
    } catch (e) {
      emit(EducationalItemsErrorState(e.toString()));
    }
  }
  Future<void> fetchEducationalLevels() async {
    emit(EducationalItemsLoadingState()); // ممكن تعمل حالة خاصة أو تستخدم نفس الحالة
    try {
      final levels = await _repository.getEducationalLevels();
      emit(EducationalLevelsLoadedState(levels));
    } catch (e) {
      emit(EducationalItemsErrorState(e.toString()));
    }
  }
  /* حالة التحميل */
Future<void> fetchEducationalFields() async {
  emit(EducationalFieldsLoadingState());
  try {
    final fields = await _repository.getEducationalFields();
    emit(EducationalFieldsLoadedState(fields));
  } catch (e) {
    emit(EducationalFieldsErrorState(e.toString()));
  }
}
/* في NewOrderCubit */
Future<void> fetchEducationalSemisters() async {
  emit(EducationalSemistersLoadingState());
  try {
    final semisters = await _repository.getEducationalSemisters();
    emit(EducationalSemistersLoadedState(semisters));
  } catch (e) {
    emit(EducationalSemistersErrorState(e.toString()));
  }
}

}
