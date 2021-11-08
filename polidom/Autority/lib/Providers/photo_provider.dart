import 'dart:convert';

import 'package:Autority/Models/reportImages.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:Autority/Contracts/location_contract.dart';
import 'package:Autority/Contracts/photo_contract.dart';
import 'package:Autority/Models/imageUpload.dart';
import 'package:Autority/Models/user_location_model.dart';

class PhotoProvider with ChangeNotifier {
  PhotoServiceContract _photoService;
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

  PhotoProvider(this._photoService);
}
