// import 'package:polidom/Models/report_model.dart';

// abstract class ReportsServiceContract {
//   Future<bool> savePliceReport(Report data);

//   Future<List<Report>> getUserReports(int userId);
// }

import 'package:polidom/Models/report_model.dart';

abstract class ReportServiceContract {
  Future<bool> savePliceReport(Report data);

  Future<List<Report>> getAllReports();

  Future<List<Report>> getUserReports(int userId);
}
