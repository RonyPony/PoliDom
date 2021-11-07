import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:Autority/Contracts/location_contract.dart';
import 'package:Autority/Contracts/photo_contract.dart';
import 'package:Autority/Models/imageUpload.dart';
import 'package:Autority/Models/user_location_model.dart';

class PhotoProvider with ChangeNotifier {
  PhotoServiceContract _photoService;

  PhotoProvider(this._photoService);
}
