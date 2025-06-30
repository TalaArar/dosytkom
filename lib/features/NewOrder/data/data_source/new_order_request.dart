import 'package:dosytkom/core/network/api_client.dart';
import 'package:dosytkom/features/NewOrder/data/model/newOrderResponse.dart';
import 'package:dosytkom/features/NewOrder/data/model/neworderModel.dart';


abstract class RemoteDataSource {
  Future<NewOrderRequestModel> newOrder({
    required String dosyahName,
    required int dosyahCount,
    required int orderAcceptance,
    required String ?libraryName,
    required String libraryPhoneNumber,
    required int orderLocation,
  });
  
}

class DataSourceImpl implements RemoteDataSource {
  @override
  Future<NewOrderRequestModel> newOrder({
    required String dosyahName,
    required int dosyahCount,
    required int orderAcceptance,
    required String? libraryName,
    required String libraryPhoneNumber,
    required int orderLocation,
  }) async{
    final body=NewOrderRequestModel(
      dosyahName: dosyahName,
      dosyahCount: dosyahCount,
      orderAcceptance: orderAcceptance,
      libraryName: libraryName,
      libraryPhoneNumber: libraryPhoneNumber,
      orderLocation: orderLocation,
    ).toJson();
      final response = await ApiClient.postData(
      endpoint: "CreateNewOrder",
      body: body,
      fromJsonT: (data) => NewOrderRequestModel.fromJson( json: {}),
    );

    return response;  
  }
}