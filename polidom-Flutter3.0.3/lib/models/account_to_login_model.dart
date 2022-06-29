class AccountToLogin {
  String? Email;
  String? Password;

  AccountToLogin({this.Email, this.Password});

  AccountToLogin.fromJson(Map<String, dynamic> json) {
    Email = json['Email'];
    Password = json['Password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Email'] = Email;
    data['Password'] = Password;
    return data;
  }
}

enum UserRoleType { admin, client, user }
