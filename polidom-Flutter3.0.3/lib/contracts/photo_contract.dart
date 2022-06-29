import 'package:flutter/cupertino.dart';

import '../models/account_to_login_model.dart';
import '../models/image_upload_model.dart';

abstract class PhotoServiceContract {
  Future<bool> uploadPhoto(List<ImageUpload> photos, BuildContext context);
  Future<bool> getPhotoById(AccountToLogin info, BuildContext context);
  Future<List<ImageUpload>> getPhotosByReportId(int reporterId);
  Future<bool> delete();
  Future<List<ImageUpload>> getAllPhotos();
}
