import 'package:flutter/material.dart';
import 'package:Autority/Contracts/reports_contract.dart';
import 'package:Autority/Models/report_model.dart';
import 'package:Autority/Services/report_service.dart';

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

  Future<int> getCount() async {
    return await _reportsService.getCount();
  }

  Future<bool> assignToAuthority(Report reportId, String authorityId) async {
    return await _reportsService.assignAuthority(reportId, authorityId);
  }

  Future<List<Report>> retriveAllReports() async {
    return await _reportsService.getAllReports();
  }

  Future<Report> getSingleReport(int id) async {
    return await _reportsService.getReportById(id);
  }

  Future<Report> getAssignedReport(Future<String> authorityId) async {
    return await _reportsService.getAssignedReport(await authorityId);
  }

  Future<Report> getCurrentAssignedReport() async {
    return await _reportsService.getCurrentAssignedReport();
  }

  Future<List<Report>> getUserReports(int userId) async {
    ReportServiceContract _reportsService;
    return _reportsService.getUserReports(userId);
  }
}
