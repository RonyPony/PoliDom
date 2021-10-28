import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:polidom/Contracts/location_contract.dart';
import 'package:polidom/Contracts/photo_contract.dart';
import 'package:polidom/Models/imageUpload.dart';
import 'package:polidom/Models/user_location_model.dart';

class PhotoProvider with ChangeNotifier {
  PhotoServiceContract _photoService;

  PhotoProvider(this._photoService);

  Future<bool> saveImage(List<ImageUpload> image, BuildContext context) async {
    if (image == null) {
      throw PlatformException(code: '400', message: "photoCantBeNull");
    }
    var x = await _photoService.uploadPhoto(image, context);
    return x;
  }
}
