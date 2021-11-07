import 'package:flutter/cupertino.dart';
import 'package:Autority/Models/account_to_login_model.dart';
import 'package:Autority/Models/imageUpload.dart';

abstract class PhotoServiceContract {
  Future<bool> getPhotoById(AccountToLogin info, BuildContext context);
  Future<List<ImageUpload>> getPhotosByReportId(int reporterId);
  Future<bool> delete();
  Future<List<ImageUpload>> getAllPhotos();
}
