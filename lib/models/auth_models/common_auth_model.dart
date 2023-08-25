class CommonAuthDataModel {
  String? token;
  User user;

  CommonAuthDataModel({
    required this.token,
    required this.user,
  });

  factory CommonAuthDataModel.fromJson(Map<String, dynamic> json) => CommonAuthDataModel(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

}

class User {
  String? id;
  dynamic image;
  String? name;
  String? email;
  dynamic phone;
  dynamic address;
  String? role;
  String? langCode;
  int? isPushNotification;
  int? isEmailNotification;
  String? referCode;
  int? isVerified;
  int? isActive;
  String? loginType;
  int? bondLimit;

  User({
    required this.id,
    this.image,
    required this.name,
    required this.email,
    this.phone,
    this.address,
    required this.role,
    required this.langCode,
    required this.isPushNotification,
    required this.isEmailNotification,
    required this.referCode,
    required this.isVerified,
    required this.isActive,
    required this.loginType,
    required this.bondLimit,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        role: json["role"],
        langCode: json["lang_code"],
        isPushNotification: json["is_push_notification"],
        isEmailNotification: json["is_email_notification"],
        referCode: json["refer_code"],
        isVerified: json["is_verified"],
        isActive: json["is_active"],
        loginType: json["login_type"],
        bondLimit: json["bond_limit"],
      );

}
