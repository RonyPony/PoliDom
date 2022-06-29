// import 'package:polidom2/models/report_model.dart';

// abstract class ReportsServiceContract {
//   Future<bool> savePliceReport(Report data);

//   Future<List<Report>> getUserReports(int userId);
// }

import 'package:flutter/widgets.dart';

import '../models/report_model.dart';

abstract class ReportServiceContract {
  Future<bool> savePliceReport(Report data, BuildContext context);

  Future<List<Report>> getAllReports();
  Future<Report> getReportById(int id);

  String getReportTypeName(int reportType);

  Future<List<Report>> getUserReports(int userId);
}
