import 'package:flutter/cupertino.dart';
import 'package:polidom2/models/account_info_model.dart';
import 'package:polidom2/models/account_to_register.dart';

import '../models/account_to_login_model.dart';
import '../models/account_to_update_model.dart';

abstract class AuthServiceContract {
  Future<bool> userExist(String email);
  Future<bool> login(AccountToLogin info, BuildContext context);
  Future<int> register(AccountToRegister info, BuildContext context);
  Future<String> getCurrentUserId();
  Future<String> getCurrentUserEmail();
  Future<AccountInfo> getUserInfo(Future<String> id);
  Future<bool> update(AccountToUpdate info, BuildContext context);
}
