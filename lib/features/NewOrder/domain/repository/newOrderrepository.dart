import 'package:dosytkom/features/NewOrder/domain/Entity/order_request_entity.dart';

abstract class NewOrderRequestRepository{
  Future<OrderRequestEntity>newOrder({required  String dosyahName,
  required int dosyahCount,
  required int orderAcceptance,
  required String libraryName,
  required String libraryPhoneNumber,
  required int? orderLocation,});
}