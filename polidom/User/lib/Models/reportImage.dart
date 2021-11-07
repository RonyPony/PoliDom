class ReportImage {
  int id;
  String name;
  String image;
  int reportId;
  String createdAt;

  ReportImage({this.id, this.name, this.image, this.reportId, this.createdAt});

  ReportImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    reportId = json['reportId'];

    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['reportId'] = this.reportId;

    data['createdAt'] = this.createdAt;
    return data;
  }
}
