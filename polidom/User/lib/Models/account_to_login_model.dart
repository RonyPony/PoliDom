class AccountToLogin {
  String email;
  String password;

  AccountToLogin({this.email, this.password});

  AccountToLogin.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}

enum UserRoleType { admin, client, user }
