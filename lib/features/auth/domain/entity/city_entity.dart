import 'package:dosytkom/features/auth/data/model/city_model.dart';

class CityEntity{
 final List<City>? payload;
   final bool? status;
   final String? resultMessage;
   final dynamic refNo;
CityEntity({required this.payload,required this.status,required this.resultMessage,required this.refNo});

}