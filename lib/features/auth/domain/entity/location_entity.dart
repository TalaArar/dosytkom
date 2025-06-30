import 'package:dosytkom/features/auth/data/model/location_model.dart';

class LocationEntity {
   final List<Location>? payload;
  final bool? status;
  final String? resultMessage;
  final dynamic refNo;

LocationEntity({required this.payload,required this.status,required this.resultMessage,required this.refNo});

}