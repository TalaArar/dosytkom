class CityModel {
  List<City>? citypayload;
  bool? status;
  String? resultMessage;
  dynamic refNo;

  CityModel({this.citypayload, this.status, this.resultMessage, this.refNo});

  CityModel.fromJson(Map<String, dynamic> json) {
    if (json['payload'] != null) {
      citypayload = <City>[];
      json['payload'].forEach((v) {
        citypayload!.add(City.fromJson(v));
      });
    }
    status = json['status'];
    resultMessage = json['resultMessage'];
    refNo = json['refNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (citypayload != null) {
      data['payload'] = citypayload!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['resultMessage'] = resultMessage;
    data['refNo'] = refNo;
    return data;
  }
}

class City {
  int? cITYNO;
  String? cITYNAME;

  City({this.cITYNO, this.cITYNAME});

  City.fromJson(Map<String, dynamic> json) {
    cITYNO = json['CITY_NO'];
    cITYNAME = json['CITY_NAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['CITY_NO'] = cITYNO;
    data['CITY_NAME'] = cITYNAME;
    return data;
  }

  @override
  String toString() => cITYNAME ?? '';
}
