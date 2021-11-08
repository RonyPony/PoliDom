import 'package:Autority/Models/reportImages.dart';
import 'package:flutter/cupertino.dart';
import 'package:Autority/Models/account_to_login_model.dart';
import 'package:Autority/Models/imageUpload.dart';

abstract class PhotoServiceContract {
  Future<bool> getPhotoById(AccountToLogin info, BuildContext context);
  Future<List<ImageUpload>> getPhotosByReportId(int reporterId);
  Future<bool> delete();
  Future<List<ReportImage>> getImagesByReportId(int reportId);
  Future<List<ImageUpload>> getAllPhotos();
}
