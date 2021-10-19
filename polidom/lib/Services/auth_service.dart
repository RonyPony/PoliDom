import 'dart:convert';
import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:polidom/Contracts/auth_contract.dart';
import 'package:polidom/Models/accountToRegister_model.dart';
import 'package:polidom/Models/account_to_login_model.dart';

import '../constants.dart';

class AuthService implements AuthServiceContract {
  @override
  Future<bool> login(AccountToLogin info, BuildContext context) async {
    try {
      var dio = Dio();
      String json = jsonEncode(info);
      Response response = await dio.post(
        '$baseApiUrl/accounts/login',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: json,
      );
      print(
          'Respuesta del api >${response.statusCode} - ${response.statusMessage}');
      return true;
    } catch (e) {
      if (e is DioError) {
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            text: e.response.data.toString());
      }
      print(e.response.data);
      return false;
    } finally {}
  }

  @override
  Future<int> register(AccountToRegister info, BuildContext context) async {
    Response response;
    try {
      var dio = Dio();
      String json = jsonEncode(info);
      response = await dio.post(
        '$baseApiUrl/accounts',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: json,
      );
      print(
          'Respuesta del api >${response.statusCode} - ${response.statusMessage}');
      return 1;
    } catch (e) {
      if (e is DioError) {
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            text: e.response.data.toString());
      }
      print(e.response.data);
      return 0;
    } finally {}
  }

  @override
  Future<bool> userExist(String email) async {
    try {
      return false;
      // var dio = Dio();
      // String body = json.encode(data);
      // Response response = await dio.get(
      //   '$baseApiUrl/reports',
      //   options: Options(headers: {
      //     HttpHeaders.contentTypeHeader: "application/json",
      //   }),
      //   data: jsonEncode(data),
      // );
      // print(
      //     'Respuesta del api >${response.statusCode} - ${response.statusMessage}');
    } catch (e) {
      print(e.toString());
      return true;
    }
  }

  int getRoleNumber(AccountToRegister info) {
    // switch (info.role) {
    //   case UserRoleType.admin:
    //     return 1;
    //   case UserRoleType.client:
    //     return 2;
    //   case UserRoleType.user:
    //     return 3;
    //   default:
    //     return 0;
    // }
  }
}
