import 'package:dosytkom/features/NewOrder/data/model/educationalItem_model.dart';
import 'package:dosytkom/features/NewOrder/domain/Entity/order_request_entity.dart';
import 'package:dosytkom/features/NewOrder/domain/repository/newOrderrepository.dart';

class NeworderUseCase {
  final NewOrderRequestRepository repository;
  
  NeworderUseCase(this.repository);

  // دالة طلب جديد
  Future<OrderRequestEntity> call({
    required String dosyahName,
    required int dosyahCount,
    required int orderAcceptance,
    required String libraryName,
    required String libraryPhoneNumber,
    required int? orderLocation,
  }) async {
    print("📦 NeworderUseCase.call()");
    print("➡️ dosyahName: $dosyahName (${dosyahName.runtimeType})");
    print("➡️ dosyahCount: $dosyahCount (${dosyahCount.runtimeType})");
    print("➡️ orderAcceptance: $orderAcceptance (${orderAcceptance.runtimeType})");
    print("➡️ libraryName: $libraryName (${libraryName.runtimeType})");
    print("➡️ libraryPhoneNumber: $libraryPhoneNumber (${libraryPhoneNumber.runtimeType})");
    print("➡️ orderLocation: $orderLocation (${orderLocation.runtimeType})");

    return await repository.newOrder(
      dosyahName: dosyahName,
      dosyahCount: dosyahCount,
      orderAcceptance: orderAcceptance,
      libraryName: libraryName,
      libraryPhoneNumber: libraryPhoneNumber,
      orderLocation: orderLocation,
    );
  }

  Future<List<EducationalItem>> getEducationalItems() async {
    return await repository.getEducationalItems();
  }
}
