import 'dart:io';

import 'package:dio/dio.dart';

class ImageUpload {
  int? reportId;
  File? photo;

  ImageUpload({this.reportId, this.photo});

  ImageUpload.fromJson(Map<String, dynamic> json) {
    reportId = json['reportId'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reportId'] = this.reportId;
    data['photo'] = this.photo;

    return data;
  }
}

class ImageRequestData {
  int? reportId;
  FormData? data;
  ImageRequestData({this.reportId, this.data});
  ImageRequestData.fromJson(Map<String, dynamic> json) {
    reportId = json['reportId'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reportId'] = this.reportId;
    data['data'] = this.data;

    return data;
  }
}
