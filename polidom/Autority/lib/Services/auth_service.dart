import 'dart:convert';
import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:Autority/Contracts/auth_contract.dart';
import 'package:Autority/Models/accountToRegister_model.dart';
import 'package:Autority/Models/account_info.dart';
import 'package:Autority/Models/account_to_login_model.dart';
import 'package:Autority/Models/account_to_update.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class AuthService implements AuthServiceContract {
  String SAVED_USER_KEY = "informacion-del-usuario";

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
      saveCurrentUser(response.data);
      print(
          'Respuesta del api >${response.statusCode} - ${response.statusMessage}');
      return true;
    } catch (e) {
      if (e is DioError) {
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            text: e.response.data
                .toString()
                .replaceAll("{", '')
                .replaceAll("[", '')
                .replaceAll("}", '')
                .replaceAll("]", ''));
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
      if (response.statusCode == 201) {
        CoolAlert.show(
            context: context, type: CoolAlertType.success, title: "Hecho");
      }
      print(
          'Respuesta del api >${response.statusCode} - ${response.statusMessage}');
      return 1;
    } catch (e) {
      if (e is DioError) {
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            text: e.response.data
                .toString()
                .replaceAll("{", '')
                .replaceAll("[", '')
                .replaceAll("}", '')
                .replaceAll("]", ''));
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

  @override
  Future<bool> update(AccountToUpdate info, BuildContext context) async {
    return true;
  }

  Future<String> getCurrentUserId() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final savedUserJson = sharedPreferences.getString(SAVED_USER_KEY);
    if (savedUserJson != null) {
      final decodedJson = jsonDecode(savedUserJson);
      String id = decodedJson["id"];
      return id;
    }
  }

  @override
  void saveCurrentUser(Map data) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final jsonData = jsonEncode(data);
      await sharedPreferences.setString(SAVED_USER_KEY, jsonData);

      final decodedJson = jsonDecode(jsonData);
      // final address = UserLocation.fromGoogleMapJson(decodedJson);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<String> getCurrentUserEmail() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final savedUserJson = sharedPreferences.getString(SAVED_USER_KEY);
    if (savedUserJson != null) {
      final decodedJson = jsonDecode(savedUserJson);
      String id = decodedJson["email"];
      return id;
    }
  }

  @override
  Future<AccountInfo> getUserInfo(Future<String> id) async {
    String idText = await id;

    Response response;
    try {
      var dio = Dio();
      response = await dio.get(
        '$baseApiUrl/accounts/$idText',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );
      if (response.statusCode == 200) {
        AccountInfo info = AccountInfo();
        info = AccountInfo.fromJson(response.data);
        return info;
      }
    } catch (e) {
      if (e is DioError) {}
      print(e);
    } finally {}
  }
}
