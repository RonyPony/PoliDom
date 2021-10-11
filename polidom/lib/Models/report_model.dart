class Report {
  int id;
  int reportType;
  int reporterUserID;
  String creationDate;
  Ubicacion ubicacion;
  String description;

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
        ? new Ubicacion.fromJson(json['ubicacion'])
        : null;
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reportType'] = this.reportType;
    data['reporterUserID'] = this.reporterUserID;
    data['creationDate'] = this.creationDate;
    if (this.ubicacion != null) {
      data['ubicacion'] = this.ubicacion.toJson();
    }
    data['description'] = this.description;
    return data;
  }
}

class Ubicacion {
  int id;
  int reportId;
  double longitude;
  double latitude;

  Ubicacion({this.id, this.reportId, this.longitude, this.latitude});

  Ubicacion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reportId = json['reportId'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reportId'] = this.reportId;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}
