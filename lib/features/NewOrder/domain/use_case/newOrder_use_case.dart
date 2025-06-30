import 'package:dosytkom/features/NewOrder/domain/Entity/order_request_entity.dart';
import 'package:dosytkom/features/NewOrder/domain/repository/newOrderrepository.dart';

class NeworderUseCase {
  final NewOrderRequestRepository repository;
  NeworderUseCase( this.repository);

  Future<OrderRequestEntity>call({
    required String dosyahName,
  required int dosyahCount,
  required int orderAcceptance,
  required String libraryName,
  required String libraryPhoneNumber,
  required int? orderLocation,
  required bool status,
  required String resultMessage,
  required String? refNo,

  
  })async{
     print("📦 NeworderUseCase.call()");
    print("➡️ dosyahName: $dosyahName (${dosyahName.runtimeType})");
    print("➡️ cityId: $dosyahCount (${dosyahCount.runtimeType})");
    print("➡️ locationId: $orderAcceptance (${orderAcceptance.runtimeType})");
    print("➡️ locationId: $libraryName (${libraryName.runtimeType})");
    print("➡️ locationId: $libraryPhoneNumber (${libraryPhoneNumber.runtimeType})");
    print("➡️ locationId: $orderLocation (${orderLocation.runtimeType})");

    return await repository.newOrder(
     dosyahName: dosyahName,
     dosyahCount: dosyahCount,
     orderAcceptance: orderAcceptance,
     libraryName: libraryName,
     libraryPhoneNumber: libraryPhoneNumber,
     orderLocation: orderLocation,
     
     
     
    );
  }
}


 