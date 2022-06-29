class AccountInfo {
  String? name;
  dynamic country;
  dynamic location;
  dynamic province;
  dynamic textDirection;
  dynamic zipCode;
  dynamic sector;
  int? role;
  String? registerDate;
  String? bornDate;
  String? id;
  String? userName;
  String? normalizedUserName;
  String? email;
  String? normalizedEmail;
  bool? emailConfirmed;
  String? passwordHash;
  String? securityStamp;
  String? concurrencyStamp;
  dynamic phoneNumber;
  bool? phoneNumberConfirmed;
  bool? twoFactorEnabled;
  dynamic lockoutEnd;
  bool? lockoutEnabled;
  int? accessFailedCount;

  AccountInfo(
      {this.name,
      this.country,
      this.location,
      this.province,
      this.textDirection,
      this.zipCode,
      this.sector,
      this.role,
      this.registerDate,
      this.bornDate,
      this.id,
      this.userName,
      this.normalizedUserName,
      this.email,
      this.normalizedEmail,
      this.emailConfirmed,
      this.passwordHash,
      this.securityStamp,
      this.concurrencyStamp,
      this.phoneNumber,
      this.phoneNumberConfirmed,
      this.twoFactorEnabled,
      this.lockoutEnd,
      this.lockoutEnabled,
      this.accessFailedCount});

  AccountInfo.fromJson(Map<String?, dynamic> json) {
    name = json['name'];
    country = json['country'];
    location = json['location'];
    province = json['province'];
    textDirection = json['textDirection'];
    zipCode = json['zipCode'];
    sector = json['sector'];
    role = json['role'];
    registerDate = json['registerDate'];
    bornDate = json['bornDate'];
    id = json['id'];
    userName = json['userName'];
    normalizedUserName = json['normalizedUserName'];
    email = json['email'];
    normalizedEmail = json['normalizedEmail'];
    emailConfirmed = json['emailConfirmed'];
    passwordHash = json['passwordHash'];
    securityStamp = json['securityStamp'];
    concurrencyStamp = json['concurrencyStamp'];
    phoneNumber = json['phoneNumber'];
    phoneNumberConfirmed = json['phoneNumberConfirmed'];
    twoFactorEnabled = json['twoFactorEnabled'];
    lockoutEnd = json['lockoutEnd'];
    lockoutEnabled = json['lockoutEnabled'];
    accessFailedCount = json['accessFailedCount'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['name'] = this.name;
    data['country'] = this.country;
    data['location'] = this.location;
    data['province'] = this.province;
    data['textDirection'] = this.textDirection;
    data['zipCode'] = this.zipCode;
    data['sector'] = this.sector;
    data['role'] = this.role;
    data['registerDate'] = this.registerDate;
    data['bornDate'] = this.bornDate;
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['normalizedUserName'] = this.normalizedUserName;
    data['email'] = this.email;
    data['normalizedEmail'] = this.normalizedEmail;
    data['emailConfirmed'] = this.emailConfirmed;
    data['passwordHash'] = this.passwordHash;
    data['securityStamp'] = this.securityStamp;
    data['concurrencyStamp'] = this.concurrencyStamp;
    data['phoneNumber'] = this.phoneNumber;
    data['phoneNumberConfirmed'] = this.phoneNumberConfirmed;
    data['twoFactorEnabled'] = this.twoFactorEnabled;
    data['lockoutEnd'] = this.lockoutEnd;
    data['lockoutEnabled'] = this.lockoutEnabled;
    data['accessFailedCount'] = this.accessFailedCount;
    return data;
  }
}
