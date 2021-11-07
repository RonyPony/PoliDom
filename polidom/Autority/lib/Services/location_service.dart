import 'dart:convert';

import 'package:Autority/Contracts/location_contract.dart';
import 'package:Autority/Models/user_location_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressService implements LocationServiceContract {
  static const String SAVED_USER_ADRESS_KEY = 'lastReportAddress';

  @override
  Future<bool> saveSelectedAddress(Map data) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final jsonData = jsonEncode(data);
      await sharedPreferences.setString(SAVED_USER_ADRESS_KEY, jsonData);

      final decodedJson = jsonDecode(jsonData);
      // final address = UserLocation.fromGoogleMapJson(decodedJson);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Map> getSavedAddress(int clientId) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final savedUserJson = sharedPreferences.getString(SAVED_USER_ADRESS_KEY);
    if (savedUserJson != null) {
      final decodedJson = jsonDecode(savedUserJson);
      //  final address =UserLocation.fromGoogleMapJson(decodedJson);
      return decodedJson;
    } else {
      return null;
    }
  }

  @override
  Future<Map> getSelectedAddress() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final savedUserJson = sharedPreferences.getString(SAVED_USER_ADRESS_KEY);
    if (savedUserJson != null) {
      final decodedJson = jsonDecode(savedUserJson);
      // final address = UserLocation.fromGoogleMapJson(decodedJson);
      return decodedJson;
    } else {
      return null;
    }
  }
}
