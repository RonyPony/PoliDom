import 'package:flutter/cupertino.dart';
import 'package:polidom/Models/account_to_login_model.dart';
import 'package:polidom/Models/imageUpload.dart';
import 'package:polidom/Models/reportImage.dart';

abstract class PhotoServiceContract {
  Future<bool> uploadPhoto(
      List<ImageUpload> photos, int reportId, BuildContext context);
  Future<bool> getPhotoById(AccountToLogin info, BuildContext context);
  Future<List<ImageUpload>> getPhotosByReportId(int reporterId);
  Future<bool> delete();
  Future<List<ImageUpload>> getAllPhotos();
  Future<List<ReportImage>> getImagesByReportId(int reportId);
}
