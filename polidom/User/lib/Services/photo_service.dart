import 'dart:convert';
import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/image.dart';
import 'package:polidom/Contracts/photo_contract.dart';
import 'package:polidom/Models/imageUpload.dart';
import 'package:polidom/Models/account_to_login_model.dart';
import 'package:polidom/Models/reportImage.dart';

import '../constants.dart';

class PhotoService implements PhotoServiceContract {
  @override
  Future<bool> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<ImageUpload>> getAllPhotos() {
    // TODO: implement getAllPhotos
    throw UnimplementedError();
  }

  @override
  Future<bool> getPhotoById(AccountToLogin info, BuildContext context) {
    // TODO: implement getPhotoById
    throw UnimplementedError();
  }

  @override
  Future<List<ImageUpload>> getPhotosByReportId(int reporterId) {
    // TODO: implement getPhotosByReportId
    throw UnimplementedError();
  }

  @override
  Future<bool> uploadPhoto(
      List<ImageUpload> photos, int reportId, BuildContext context) {
    photos.forEach((element) async {
      try {
        var dio = Dio();
        // String body = json.encode(element);

        final FormData datax = FormData.fromMap({
          'image': await MultipartFile.fromFile(element.photo.path),
          'reportId': reportId
        });

        Response response = await dio.post('$baseApiUrl/photos/new',
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: "multipart/form-data",
            }),
            data: datax // lastData.toJson(),
            );
        print("Image>" + response.statusMessage);
        bool success = response.statusCode == 201;
        CoolAlertType tipo = CoolAlertType.info;
        if (success) {
          tipo = CoolAlertType.success;
        } else {
          tipo = CoolAlertType.error;
        }
        CoolAlert.show(
            title: "Reporte de carga",
            context: context,
            type: tipo,
            text: "Carga de las imagenes > " + response.statusMessage);
      } catch (e) {
        if (e is DioError) {
          CoolAlert.show(
              context: context,
              text: e.response.data,
              type: CoolAlertType.error);
        }
        print(e.toString());
      }
    });
  }

  @override
  Future<List<ReportImage>> getImagesByReportId(int reportId) async {
    try {
      var dio = Dio();
      Response response =
          await dio.get('$baseApiUrl/photos/report?reportId=$reportId');
      List lista;
      List<ReportImage> returningList = List<ReportImage>();
      if (response.data is List) {
        lista = response.data;
      }
      lista.forEach((element) {
        String jsoned = jsonEncode(element);
        ReportImage tmpImage = ReportImage.fromJson(element);
        print(jsoned);
        returningList.add(tmpImage);
      });

      return returningList;
    } catch (e) {
      print(e.toString());
    }
  }
}
