class AccountToUpdate {
  String userName;
  int id;
  String name;
  String email;
  String password;
  String phoneNumber;
  String country;
  String location;
  String province;
  String textDirection;
  String zipCode;
  String sector;
  int role;
  String registerDate;
  String bornDate;

  AccountToUpdate(
      {this.userName,
      this.name,
      this.id,
      this.email,
      this.password,
      this.phoneNumber,
      this.country,
      this.location,
      this.province,
      this.textDirection,
      this.zipCode,
      this.sector,
      this.role,
      this.registerDate,
      this.bornDate});

  AccountToUpdate.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    name = json['name'];
    id = json['id'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    country = json['country'];
    location = json['location'];
    province = json['province'];
    textDirection = json['textDirection'];
    zipCode = json['zipCode'];
    sector = json['sector'];
    role = json['role'];
    registerDate = json['registerDate'];
    bornDate = json['bornDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = userName;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    data['country'] = country;
    data['id'] = id;
    data['location'] = location;
    data['province'] = province;
    data['textDirection'] = textDirection;
    data['zipCode'] = zipCode;
    data['sector'] = sector;
    data['role'] = role;
    data['registerDate'] = registerDate;
    data['bornDate'] = bornDate;
    return data;
  }
}

enum UserRoleType { admin, client, user }
