import 'dart:convert';
import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:Autority/Contracts/photo_contract.dart';
import 'package:Autority/Models/imageUpload.dart';
import 'package:Autority/Models/account_to_login_model.dart';

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
}