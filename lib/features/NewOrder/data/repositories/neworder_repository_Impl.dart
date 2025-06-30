import 'package:dosytkom/features/NewOrder/data/data_source/new_order_request.dart';
import 'package:dosytkom/features/NewOrder/domain/Entity/order_request_entity.dart';
import 'package:dosytkom/features/NewOrder/domain/repository/newOrderrepository.dart';
import 'package:dosytkom/features/auth/domain/entity/auth_entity.dart';

class RemoteDataSourceImpl extends NewOrderRequestRepository {
  final RemoteDataSource dataSource;

  RemoteDataSourceImpl( { required this.dataSource});
 

  @override
  Future<OrderRequestEntity> newOrder({

    required String dosyahName,
  required int dosyahCount,
  required int orderAcceptance,
  required String libraryName,
  required String libraryPhoneNumber,
  int? orderLocation,    })async {
    return  await dataSource.newOrder(
      dosyahName: dosyahName,
      dosyahCount: dosyahCount,
      orderAcceptance: orderAcceptance,
      libraryName: libraryName,
      libraryPhoneNumber: libraryPhoneNumber,  orderLocation: orderLocation ?? 0,
     


    );
  }

}