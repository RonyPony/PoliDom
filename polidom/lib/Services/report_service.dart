import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:polidom/Contracts/reports_contract.dart';
import 'package:polidom/Models/report_model.dart';

import '../constants.dart';

class ReportService implements ReportServiceContract {
  @override
  Future<List<Report>> getUserReports(int userId) {
    print('ok');
  }

  @override
  Future<bool> savePliceReport(Report data) async {
    try {
      var dio = Dio();

      Response response = await dio.post(
        '$baseApiUrl/reports',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(data),
      );
      print(response.data);
    } catch (e) {}
  }

  @override
  Future<List<Report>> getAllReports() async {
    try {
      var dio = Dio();
      Response response = await dio.get('$baseApiUrl/reports');

      final jsonData = jsonEncode(response.data);
      List<Report> reports = List<Report>();
      if (response.data is List) {
        List<dynamic> listado = response.data;
        listado.forEach((element) {
          reports.add(Report.fromJson(element));
        });
      }
      return reports;
    } catch (e) {}
  }
}
