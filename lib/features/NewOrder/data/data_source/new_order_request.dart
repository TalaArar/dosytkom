import 'package:dosytkom/core/network/api_client.dart';
import 'package:dosytkom/features/NewOrder/data/model/educationalField_model.dart';
import 'package:dosytkom/features/NewOrder/data/model/educationalItem_model.dart';
import 'package:dosytkom/features/NewOrder/data/model/educationalItemsResponse_model.dart';
import 'package:dosytkom/features/NewOrder/data/model/educationalLevel_model.dart';
import 'package:dosytkom/features/NewOrder/data/model/educationalSemister_model.dart';
import 'package:dosytkom/features/NewOrder/data/model/newOrderResponse.dart';
import 'package:dosytkom/features/NewOrder/data/model/neworderModel.dart';


abstract class RemoteDataSource {
    Future<List<EducationalItem>> fetchEducationalItems();

  Future<NewOrderRequestModel> newOrder({
    required String dosyahName,
    required int dosyahCount,
    required int orderAcceptance,
    required String ?libraryName,
    required String libraryPhoneNumber,
    required int orderLocation,
  });

  Future<List<EducationalLevel>> fetchEducationalLevels() ;
    Future<List<EducationalField>> getEducationalFields();
      Future<List<EducationalSemister>> getEducationalSemisters();


  
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
  
  @override
  Future<List<EducationalItem>> fetchEducationalItems() async {
    final response = await ApiClient.getData(
      endPoint: "GetEducationalItems",  
      fromJsonT: (data) {
        final responseObj = EducationalItemsResponse.fromJson(data);
        if (responseObj.status) {
          return responseObj.payload;
        } else {
          throw Exception('فشل تحميل المواد: ${responseObj.resultMessage}');
        }
      },
    );
    return response;
}
 Future<List<EducationalLevel>> fetchEducationalLevels() async {
    final response = await ApiClient.getData(
      endPoint: 'GetEducationalLevel',
      fromJsonT: (data) {
        final list = data['payload'] as List;
        return list.map((e) => EducationalLevel.fromJson(e)).toList();
      },
    );
    return response;
  }
  Future<List<EducationalField>> getEducationalFields() async {
  final result = await ApiClient.getData(
    endPoint: 'GetEducationalField',
    fromJsonT: (data) {
      final list = data['payload'] as List;
      return list.map((e) => EducationalField.fromJson(e)).toList();
    },
  );
  return result;
}
Future<List<EducationalSemister>> getEducationalSemisters() async {
  final result = await ApiClient.getData(
    endPoint: 'GetEducationalSemister',
    fromJsonT: (data) {
      final list = data['payload'] as List;
      return list.map((e) => EducationalSemister.fromJson(e)).toList();
    },
  );
  return result;
}



}