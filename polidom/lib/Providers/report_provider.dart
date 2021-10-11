import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:polidom/Contracts/reports_contract.dart';
import 'package:polidom/Models/report_model.dart';

class ReportProvider with ChangeNotifier {
  ReportsServiceContract _reportsService;

  ReportProvider(this._reportsService);
  bool wasSaved = false;

  Future<bool> placePoliceReport(Report data) async {
    print(data);
    return await _reportsService.savePliceReport(data);
  }

  Future<List<Report>> getUserReports(int userId) async {
    return _reportsService.getUserReports(userId);
  }
}
