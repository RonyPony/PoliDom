// import 'package:Autority/Models/report_model.dart';

// abstract class ReportsServiceContract {
//   Future<bool> savePliceReport(Report data);

//   Future<List<Report>> getUserReports(int userId);
// }

import 'package:flutter/widgets.dart';
import 'package:Autority/Models/report_model.dart';

abstract class ReportServiceContract {
  Future<bool> savePliceReport(Report data, BuildContext context);

  Future<List<Report>> getAllReports();
  Future<Report> getReportById(int id);
  Future<Report> getAssignedReport(String authorityId);

  String getReportTypeName(int reportType);

  Future<int> getCount();
  Future<bool> assignAuthority(Report report, String authorityId);
  Future<List<Report>> getUserReports(int userId);
}
