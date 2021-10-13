import 'package:flutter/material.dart';
import 'package:polidom/Contracts/reports_contract.dart';
import 'package:polidom/Models/report_model.dart';
import 'package:polidom/Services/report_service.dart';

class ReportProvider with ChangeNotifier {
  final ReportService _reportsService;
  bool wasSaved = false;
  ReportProvider(this._reportsService);

  Future<bool> placePoliceReport(Report data) async {
    print(data.creationDate);
    final res = await _reportsService.savePliceReport(data);
    return res;
  }

  Future<List<Report>> retriveAllReports() async {
    return await _reportsService.getAllReports();
  }

  Future<List<Report>> getUserReports(int userId) async {
    ReportServiceContract _reportsService;
    return _reportsService.getUserReports(userId);
  }
}
