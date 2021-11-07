import 'package:flutter/cupertino.dart';
import 'package:Autority/Models/accountToRegister_model.dart';
import 'package:Autority/Models/account_info.dart';
import 'package:Autority/Models/account_to_login_model.dart';
import 'package:Autority/Models/account_to_update.dart';

abstract class AuthServiceContract {
  Future<bool> userExist(String email);
  Future<bool> login(AccountToLogin info, BuildContext context);
  Future<int> register(AccountToRegister info, BuildContext context);
  Future<String> getCurrentUserId();
  Future<String> getCurrentUserEmail();
  Future<AccountInfo> getUserInfo(Future<String> id);
  Future<bool> update(AccountToUpdate info, BuildContext context);
}
