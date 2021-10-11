import 'package:dio/dio.dart';
import 'package:polidom/Contracts/reports_contract.dart';
import 'package:polidom/Models/report_model.dart';

class ReportService implements ReportsServiceContract {
  @override
  Future<List<Report>> getUserReports(int userId) {
    // TODO: implement getUserReports
    throw UnimplementedError();
  }

  @override
  Future<bool> savePliceReport(Report data) async {
    try {
      var dio = Dio();
      Response response = await dio.get('https://google.com');
      print(response.data);
    } catch (e) {}
  }
}
