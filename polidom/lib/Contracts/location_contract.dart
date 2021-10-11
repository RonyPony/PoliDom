import 'package:polidom/Models/user_location_model.dart';

abstract class LocationServiceContract {
  Future<Map> getSelectedAddress();

  Future<bool> saveSelectedAddress(Map data);

  Future<Map> getSavedAddress(int clientId);
}
