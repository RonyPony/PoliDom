import 'package:flutter/cupertino.dart';
import 'package:polidom/Models/accountToRegister_model.dart';
import 'package:polidom/Models/account_to_login_model.dart';

abstract class AuthServiceContract {
  Future<bool> userExist(String email);
  Future<bool> login(AccountToLogin info, BuildContext context);
  Future<int> register(AccountToRegister info, BuildContext context);
}
