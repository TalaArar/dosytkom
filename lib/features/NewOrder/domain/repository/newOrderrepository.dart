import 'package:dosytkom/features/NewOrder/data/model/educationalField_model.dart';
import 'package:dosytkom/features/NewOrder/data/model/educationalItem_model.dart';
import 'package:dosytkom/features/NewOrder/data/model/educationalLevel_model.dart';
import 'package:dosytkom/features/NewOrder/data/model/educationalSemister_model.dart';
import 'package:dosytkom/features/NewOrder/domain/Entity/order_request_entity.dart';

abstract class NewOrderRequestRepository {
  Future<List<EducationalItem>> getEducationalItems();
  Future<List<EducationalLevel>> getEducationalLevels();
  Future<List<EducationalField>> getEducationalFields();
  Future<List<EducationalSemister>> getEducationalSemisters();


  Future<OrderRequestEntity> newOrder({
    required String dosyahName,
    required int dosyahCount,
    required int orderAcceptance,
    required String libraryName,
    required String libraryPhoneNumber,
    required int? orderLocation,
  });
}
