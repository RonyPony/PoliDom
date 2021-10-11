abstract class LocationServiceContract {
  Future<Map> getSelectedAddress();

  Future<bool> saveSelectedAddress(Map data);

  Future<Map> getSavedAddress(int clientId);
}
