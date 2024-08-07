

import 'package:polidom2/models/user_location_model.dart';

class Report {
  int? id;
  int? reportType;
  String? reporterUserID;
  String? creationDate;
  bool? isCompleted;
  int? assignedAuthorityId;
  UserLocation? ubicacion;
  String? description;

  Report(
      {this.id,
      this.reportType,
      this.reporterUserID,
      this.creationDate,
      this.ubicacion,
      this.description});

  Report.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reportType = json['reportType'];
    reporterUserID = json['reporterUserID'];
    creationDate = json['creationDate'];
    ubicacion = json['ubicacion'] != null
        ? new UserLocation.fromJson(json['ubicacion'])
        : null;
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    UserLocation loc = UserLocation();
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reportType'] = this.reportType;
    data['reporterUserID'] = this.reporterUserID;
    data['creationDate'] = this.creationDate;
    if (this.ubicacion != null) {
      // data['ubicacion'] = loc.toJson();
      data['ubicacion'] = this.ubicacion;
    }
    data['description'] = this.description;
    return data;
  }
}
