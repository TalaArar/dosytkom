class LocationModel {
  List<Location>? locationpayload;
  bool? status;
  String? resultMessage;
  dynamic refNo;

  LocationModel({this.locationpayload, this.status, this.resultMessage, this.refNo});

  LocationModel.fromJson(Map<String, dynamic> json) {
    if (json['payload'] != null) {
      locationpayload = <Location>[];
      json['payload'].forEach((v) {
        locationpayload!.add(Location.fromJson(v));
      });
    }
    status = json['status'];
    resultMessage = json['resultMessage'];
    refNo = json['refNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (locationpayload != null) {
      data['payload'] = locationpayload!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['resultMessage'] = resultMessage;
    data['refNo'] = refNo;
    return data;
  }
}

class Location {
  int? locationNo;
  String? locationName;

  Location({this.locationNo, this.locationName});

  Location.fromJson(Map<String, dynamic> json) {
    locationNo = json['LOCATION_NO'];
    locationName = json['LOCATION_NAME'];
  }

  Map<String, dynamic> toJson() {
    return {
      'LOCATION_NO': locationNo,
      'LOCATION_NAME': locationName,
    };
  }

  @override
  String toString() => locationName ?? '';
}
