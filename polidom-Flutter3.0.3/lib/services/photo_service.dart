import 'dart:convert';
import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';
import '../contracts/photo_contract.dart';
import '../models/account_to_login_model.dart';
import '../models/image_upload_model.dart';

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
  Future<bool> uploadPhoto(List<ImageUpload> photos, BuildContext context) {
    Future<bool> nullx =false as Future<bool>;
    photos.forEach((element) async {
      try {
        var dio = Dio();
        // String body = json.encode(element);

        final FormData datax = FormData.fromMap({
          'image': await MultipartFile.fromFile(element.photo!.path),
          'reportId': '12'
        });

        // datax.files.add(MapEntry(
        //     'files', await MultipartFile.fromFile(element.photo.path)));
        // ImageRequestData lastData = ImageRequestData();
        // lastData.data = datax;
        // lastData.reportId = element.reportId;
        Response response = await dio.post('$baseApiUrl/photos/new',
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: "multipart/form-data",
            }),
            data: datax // lastData.toJson(),
            );
        CoolAlert.show(
            context: context,
            type: CoolAlertType.info,
            text: response.statusMessage);
      } catch (e){
        print(e.toString());
      }
    });
    return nullx;
  }
}
