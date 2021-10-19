import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:polidom/Contracts/auth_contract.dart';
import 'package:polidom/Models/accountToRegister_model.dart';
import 'package:polidom/Models/account_to_login_model.dart';

class AuthProvider with ChangeNotifier {
  AuthServiceContract authService;
  AuthProvider(this.authService);

  Future<bool> userExistence(String email) async {
    var x = await this.authService.userExist(email);
    return x;
  }

  Future<int> register(AccountToRegister info, BuildContext context) async {
    var x = await authService.register(info, context);
    return x;
  }

  Future<bool> login(AccountToLogin info, BuildContext context) async {
    var x = await authService.login(info, context);
    return x;
  }
}
