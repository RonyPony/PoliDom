import 'package:flutter/cupertino.dart';

import '../contracts/auth_contract.dart';
import '../models/account_info_model.dart';
import '../models/account_to_login_model.dart';
import '../models/account_to_register.dart';
import '../models/account_to_update_model.dart';

class AuthProvider with ChangeNotifier {
  AuthServiceContract authService;
  AuthProvider(this.authService);

  Future<bool> userExistence(String email) async {
    var x = await this.authService.userExist(email);
    return x;
  }

  Future<String> getCurrentUserId() async {
    var x = await this.authService.getCurrentUserId();
    return x;
  }

  Future<AccountInfo> getCurrentUser(Future<String> id) async {
    var info = await this.authService.getUserInfo(id);
    return info;
  }

  Future<String> getCurrentUserEmail() async {
    var x = await this.authService.getCurrentUserEmail();
    return x;
  }

  Future<int> register(AccountToRegister info, BuildContext context) async {
    var x = await authService.register(info, context);
    return x;
  }

  Future<bool> update(AccountToUpdate info, BuildContext context) async {
    var x = await authService.update(info, context);
    return x;
  }

  Future<bool> login(AccountToLogin info, BuildContext context) async {
    var x = await authService.login(info, context);
    return x;
  }
}
