import 'dart:ffi';

class UserLocation {
  // int id;
  int reportId;
  double longitude;
  double latitude;
  String zipCode;
  String txtdireccion;
  String pais;
  String provincia;
  String localidad;
  String sector;
  DateTime creationDate;

  UserLocation();
  UserLocation.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    reportId = json['reportId'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    zipCode = json['zipCode'];
    creationDate = json['creationDate'];
    pais = json['pais'];
    provincia = json['provincia'];
    localidad = json['localidad'];
    sector = json['sector'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this.id;
    data['reportId'] = this.reportId;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['reporterUserID'] = this.reportId;
    data['creationDate'] = this.creationDate;
    data['pais'] = this.pais;
    data['provincia'] = this.provincia;
    data['localidad'] = this.localidad;
    data['sector'] = this.sector;
    return data;
  }
}

class Coordenadas {
  String longitude;
  String latitude;
}

UserLocation getLocationFromMap(Map mapa) {
  UserLocation location = UserLocation();
  location.latitude = getLatitude(mapa["coordinates"]);
  location.longitude = getLongitude(mapa["coordinates"]);
  location.zipCode = mapa["postalCode"];
  location.txtdireccion = mapa["addressLine"];
  location.pais = mapa["countryName"];
  location.provincia = mapa["adminArea"];
  location.sector = mapa["subLocality"];
  location.localidad = mapa["locality"];
  location.reportId = 123;
  return location;
}

double getLatitude(mapa) {
  return mapa["latitude"];
}

double getLongitude(mapa) {
  return mapa["longitude"];
}

// "coordinates" -> Map (2 items)
// 2:"countryName" -> "Dominican Republic"
// 1:"addressLine" -> "C. Lorenzo Despradel 27, Santo Domingo, Dominican Republic"
// 3:"countryCode" -> "DO"
// 4:"featureName" -> "27"
// 5:"postalCode" -> null
// 6:"locality" -> "Santo Domingo"
// 7:"subLocality" -> "Los Prados"
// 8:"adminArea" -> "Distrito Nacional"
// 9:"subAdminArea" -> "Santo Domingo de Guzman"
// 10:"thoroughfare" -> "Calle Lorenzo Despradel"
// 11:"subThoroughfare" -> "27"
