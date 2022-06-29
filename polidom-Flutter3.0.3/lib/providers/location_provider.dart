import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:polidom2/contracts/location_contract.dart';

import '../models/user_location_model.dart';

class LocationProvider with ChangeNotifier {
  LocationServiceContract? _addressService;
  UserLocation? currentUserAddress;

  LocationProvider(this._addressService);
  bool wasSaved = false;

  Future<Map> getSelectedAddress() async {
    final res = await _addressService!.getSelectedAddress();
    // currentUserAddress = res;

    if (currentUserAddress != null) {
      currentUserAddress!.zipCode = currentUserAddress!.zipCode ?? '0';
    }

    notifyListeners();

    return res;
  }

  Future<bool> saveAddress(Map data) async {
    if (data == null || data.length == 0) {
      throw PlatformException(code: '400', message: "addressCantBeNull");
    }
    wasSaved = await _addressService!.saveSelectedAddress(data);
    return wasSaved;
  }
}
