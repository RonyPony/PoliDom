import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:polidom/Contracts/location_contract.dart';
import 'package:polidom/Models/user_location_model.dart';
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

  @override
  Future<Position> getGpsLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getLastKnownPosition();
  }
}
