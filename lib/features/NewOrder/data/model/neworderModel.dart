import 'package:dosytkom/features/NewOrder/domain/Entity/order_request_entity.dart';

class NewOrderRequestModel extends OrderRequestEntity {
  NewOrderRequestModel({
    required super.dosyahName,
    required super.dosyahCount,
    required super.orderAcceptance,
     super.libraryName,
    required super.libraryPhoneNumber,
    super.orderLocation,

  });
  factory NewOrderRequestModel.fromJson({required Map<String, dynamic> json}) {
    return NewOrderRequestModel(
      dosyahName: json['dosyahName'],
      dosyahCount: json['dosyahCount'],
      orderAcceptance: json['orderAcceptance'],
      libraryName: json['libraryName'],
      libraryPhoneNumber: json['libraryPhoneNumber'],
      orderLocation: json['orderLocation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "DOSYAH_NAME": dosyahName,
      "DOSYAH_COUNT": dosyahCount,
      "ORDER_ACCEPTANCE": orderAcceptance,
      "LIBRARY_NAME": libraryName,
      "LIBRARY_PHONE_NUMBER": libraryPhoneNumber,
      "ORDER_LOCATION": orderLocation,
      
    };
  }
}
