// import 'package:polidom/Models/report_model.dart';

// abstract class ReportsServiceContract {
//   Future<bool> savePliceReport(Report data);

//   Future<List<Report>> getUserReports(int userId);
// }

import 'package:flutter/widgets.dart';
import 'package:polidom/Models/report_model.dart';

abstract class ReportServiceContract {
  Future<int> savePliceReport(Report data, BuildContext context);

  Future<List<Report>> getAllReports();
  Future<Report> getReportById(int id);

  String getReportTypeName(int reportType);

  Future<List<Report>> getUserReports(int userId);
}
