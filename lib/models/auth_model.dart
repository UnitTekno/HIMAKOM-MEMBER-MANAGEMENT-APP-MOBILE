import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));
User userFromJson(String str) => User.fromJson(json.decode(str));

class AuthModel {
  User user;
  String token;

  AuthModel({required this.user, required this.token});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(user: User.fromJson(json['user']), token: json['token']);
  }
}

class User {
  int id;
  String name;
  String email;
  String nim;
  String npa;
  String nameBagus;
  String picture;
  String year;
  int gender;
  int departmentId;
  int cabinetId;
  String roleName;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.nim,
    required this.npa,
    required this.nameBagus,
    required this.picture,
    required this.year,
    required this.gender,
    required this.departmentId,
    required this.cabinetId,
    required this.roleName,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        nim: json["nim"],
        npa: json["npa"],
        nameBagus: json["name_bagus"],
        picture: json["picture"],
        year: json["year"],
        gender: json["gender"],
        departmentId: json["department_id"],
        cabinetId: json["cabinet_id"],
        roleName: json["role_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "nim": nim,
        "npa": npa,
        "name_bagus": nameBagus,
        "picture": picture,
        "year": year,
        "gender": gender,
        "department_id": departmentId,
        "cabinet_id": cabinetId,
        "role_name": roleName,
      };
}
