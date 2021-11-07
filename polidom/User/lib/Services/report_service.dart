import 'dart:convert';
import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polidom/Contracts/reports_contract.dart';
import 'package:polidom/Models/report_model.dart';

import '../constants.dart';

class ReportService implements ReportServiceContract {
  @override
  Future<List<Report>> getUserReports(int userId) {
    print('ok');
  }

  @override
  Future<int> savePliceReport(Report data, BuildContext context) async {
    try {
      var dio = Dio();
      // String body = json.encode(data);
      Response response = await dio.post(
        '$baseApiUrl/reports',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(data),
      );
      if (data.reportType != 1) {
        CoolAlert.show(
            context: context,
            type: CoolAlertType.info,
            text: response.statusMessage);
      }
      return response.data;
    } catch (e) {
      print(e.toString());
      if (e is DioError) {
        DioError error = DioError(error: e);
        CoolAlert.show(
            context: context,
            type: CoolAlertType.info,
            text: error.error.response.data);
      }
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

  Icon getReportIcon(int reportType) {
    switch (reportType) {
      case 0808:
        return Icon(Icons.local_police);
        break;
      case 1:
        return Icon(
          Icons.gps_fixed_rounded,
          size: 40,
          color: Colors.red,
        );
        break;
      case 2:
        return Icon(
          Icons.local_police,
          size: 50,
          color: Colors.blue,
        );
        break;
      case 3:
        return Icon(
          Icons.person_pin_outlined,
          size: 40,
          color: Colors.red,
        );
        break;
      case 4:
        return Icon(
          Icons.speaker_rounded,
          size: 40,
          color: Colors.green,
        );
        break;
      case 5:
        return Icon(
          Icons.donut_small_rounded,
          size: 40,
          color: Colors.deepPurpleAccent,
        );
        break;
      case 6:
        return Icon(
          Icons.airline_seat_flat_angled_sharp,
          size: 40,
          color: Colors.lime,
        );
        break;
      case 7:
        return Icon(
          Icons.format_strikethrough_rounded,
          size: 40,
          color: Colors.deepOrange,
        );
        break;
      case 8:
        return Icon(
          Icons.car_repair,
          size: 40,
          color: Colors.pinkAccent,
        );
        break;
      case 9:
        return Icon(
          Icons.car_rental,
          size: 40,
          color: Colors.amberAccent,
        );
        break;
      case 10:
        return Icon(
          Icons.delete_forever_outlined,
          size: 40,
          color: Colors.red,
        );
        break;
      default:
        return Icon(Icons.local_police);
    }
  }

  @override
  String getReportTypeName(int reportType) {
    switch (reportType) {
      case 0808:
        return "Error cargando el tipo de reporte";
        break;
      case 1:
        return "PANICO";
        break;
      case 2:
        return "Reporte Policial de Robo";
        break;
      case 3:
        return "Reporte Policial de Atraco";
        break;
      case 4:
        return "Reporte Policial de ruido y contaminacion sonora";
        break;
      case 5:
        return "Reporte Policial de violencia sexual";
        break;
      case 6:
        return "Reporte Policial de violencia familiar";
        break;
      case 7:
        return "Reporte Policial de violencia callejera";
        break;
      case 8:
        return "Reporte Policial de accidente de transito";
        break;
      case 9:
        return "Reporte Policial de vehiculo abandonado";
        break;
      case 10:
        return "Reporte Policial de drogas o sustancias prohividas";
        break;
      case 11:
        return "Reporte de emergencia paramedico";
        break;
      case 12:
        return "Reporte de incendio";
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
