class UserLocation {
  String longitude;
  String latitude;
  String zipCode;
  String txtdireccion;
  String pais;
  String provincia;
  String localidad;
  String sector;
}

class Coordenadas {
  String longitude;
  String latitude;
}

UserLocation getLocationFromMap(Map mapa) {
  UserLocation location = UserLocation();
  location.latitude = getLatitude(mapa["coordinates"]).toString();
  location.longitude = getLongitude(mapa["coordinates"]).toString();
  location.zipCode = mapa["postalCode"];
  location.txtdireccion = mapa["addressLine"];
  location.pais = mapa["countryName"];
  location.provincia = mapa["adminArea"];
  location.sector = mapa["subLocality"];
  location.localidad = mapa["locality"];
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
