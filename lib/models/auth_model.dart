import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));
User userFromJson(String str) => User.fromJson(json.decode(str));

class AuthModel {
  User user;
  String accessToken;

  AuthModel({required this.user, required this.accessToken});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
        user: User.fromJson(json['user']), accessToken: json['access_token']);
  }
}

class User {
  String name;
  String nim;
  String email;
  String na;
  String year;
  String namaBagus;
  String role;
  String avatar;

  User(
      {required this.name,
      required this.nim,
      required this.email,
      required this.na,
      required this.year,
      required this.namaBagus,
      required this.role,
      required this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'],
        nim: json['nim'],
        email: json['email'],
        na: json['na'],
        year: json['year'],
        namaBagus: json['nama_bagus'],
        role: json['role'] ?? json['role_name'],
        avatar: json['avatar']);
  }
}
