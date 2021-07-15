class Isaretler {
  int id;
  int groupNumber;
  String latitude;
  String longitude;
  int intRegionId;

  Isaretler(
      {required this.id,
        required this.groupNumber,
        required this.latitude,
        required this.longitude,
        required this.intRegionId});


  factory Isaretler.fromJson(Map<String, dynamic> json) {
    return Isaretler(
    id : json['Id'],
    groupNumber : json['GroupNumber'],
    latitude : json['Latitude'],
    longitude : json['Longitude'],
    intRegionId : json['IntRegionId']);
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['GroupNumber'] = this.groupNumber;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['IntRegionId'] = this.intRegionId;
    return data;
  }
}
