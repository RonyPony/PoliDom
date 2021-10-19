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
      String body = json.encode(data);
      Response response = await dio.post(
        '$baseApiUrl/reports',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(data),
      );
      print(
          'Respuesta del api >${response.statusCode} - ${response.statusMessage}');
    } catch (e) {
      print(e.toString());
    }
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

  @override
  String getReportTypeName(int reportType) {
    switch (reportType) {
      case 0808:
        return "Error cargando el tipo de reporte";
        break;
      case 0:
        return "XXX";
        break;
      case 1:
        return "Reporte Policial de Robo";
        break;
      case 2:
        return "Reporte Policial de Atraco";
        break;
      default:
        return "Otro tipo de Reporte";
    }
  }

  @override
  Future<Report> getReportById(int id) async {
    try {
      var dio = Dio();
      Response response = await dio.get('$baseApiUrl/reports/$id');

      Report reporte = Report.fromJson(response.data);
      return reporte;
    } catch (e) {}
  }
}
