import 'package:flutter/material.dart';
import 'package:polidom/Contracts/reports_contract.dart';
import 'package:polidom/Models/report_model.dart';
import 'package:polidom/Services/report_service.dart';

class ReportProvider with ChangeNotifier {
  final ReportService _reportsService;
  bool wasSaved = false;
  ReportProvider(this._reportsService);

  Future<bool> placePoliceReport(Report data, BuildContext context) async {
    print(data.creationDate);
    final res = await _reportsService.savePliceReport(data, context);
    return res;
  }

  Widget getReportIcon(int reportType) {
    return _reportsService.getReportIcon(reportType);
  }

  String getReportLabel(int reportType) {
    final res = _reportsService.getReportTypeName(reportType);
    return res;
  }

  Future<List<Report>> retriveAllReports() async {
    return await _reportsService.getAllReports();
  }

  Future<Report> getSingleReport(int id) async {
    return await _reportsService.getReportById(id);
  }

  Future<List<Report>> getUserReports(int userId) async {
    ReportServiceContract _reportsService;
    return _reportsService.getUserReports(userId);
  }
}
