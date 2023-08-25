class AuthModel {
  String token;
  User user;

  AuthModel({
    required this.token,
    required this.user,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
      };
}

class User {
  int id;
  String username;
  String email;
  String usertype;
  dynamic designation;
  dynamic phone;
  dynamic address;
  dynamic image;
  dynamic birthDate;
  int isActive;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.usertype,
    required this.designation,
    required this.phone,
    required this.address,
    required this.image,
    required this.birthDate,
    required this.isActive,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        usertype: json["usertype"],
        designation: json["designation"],
        phone: json["phone"],
        address: json["address"],
        image: json["image"],
        birthDate: json["birth_date"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "usertype": usertype,
        "designation": designation,
        "phone": phone,
        "address": address,
        "image": image,
        "birth_date": birthDate,
        "is_active": isActive,
      };
}
