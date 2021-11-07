import 'dart:convert';
import 'dart:io' as Io;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:polidom/Contracts/location_contract.dart';
import 'package:polidom/Contracts/photo_contract.dart';
import 'package:polidom/Models/imageUpload.dart';
import 'package:polidom/Models/reportImage.dart';
import 'package:polidom/Models/user_location_model.dart';

class PhotoProvider with ChangeNotifier {
  PhotoServiceContract _photoService;

  PhotoProvider(this._photoService);

  Future<bool> saveImage(
      List<ImageUpload> image, int reportId, BuildContext context) async {
    if (image == null) {
      throw PlatformException(code: '400', message: "photoCantBeNull");
    }
    var x = await _photoService.uploadPhoto(image, reportId, context);
    return x;
  }

  Future<List<Image>> getAllImagesByReportId(int reportId) async {
    List<Image> imagenes = List<Image>();
    List<ReportImage> x = await _photoService.getImagesByReportId(reportId);
    x.forEach((element) {
      final decodedBytes = base64Decode(element.image);
      Image tmpPic = Image.memory(decodedBytes);
      imagenes.add(tmpPic);
    });

    return imagenes;
  }
}
