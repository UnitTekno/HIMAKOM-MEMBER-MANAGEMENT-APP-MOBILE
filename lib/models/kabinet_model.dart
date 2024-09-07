// To parse this JSON KabinetModel, do
//
//     final kabinetModel = kabinetModelFromJson(jsonString);

import 'dart:convert';

KabinetModel kabinetModelFromJson(String str) =>
    KabinetModel.fromJson(json.decode(str));

String kabinetModelToJson(KabinetModel data) => json.encode(data.toJson());

class KabinetModel {
  int id;
  String name;
  String description;
  String logo;
  String year;
  int isActive;
  String visi;
  String misi;
  List<Filosofy> filosofies;
  List<User> users;
  List<Department> departments;

  KabinetModel({
    required this.id,
    required this.name,
    required this.description,
    required this.logo,
    required this.year,
    required this.isActive,
    required this.visi,
    required this.misi,
    required this.filosofies,
    required this.users,
    required this.departments,
  });

  factory KabinetModel.fromJson(Map<String, dynamic> json) => KabinetModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        logo: json["logo"],
        year: json["year"],
        isActive: json["is_active"],
        visi: json["visi"],
        misi: json["misi"],
        filosofies: List<Filosofy>.from(
            json["filosofies"].map((x) => Filosofy.fromJson(x))),
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
        departments: List<Department>.from(
            json["dbus"].map((x) => Department.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "logo": logo,
        "year": year,
        "is_active": isActive,
        "visi": visi,
        "misi": misi,
        "filosofies": List<dynamic>.from(filosofies.map((x) => x.toJson())),
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "dbus": List<dynamic>.from(departments.map((x) => x.toJson())),
      };
}

class Filosofy {
  int id;
  String logo;
  String label;
  int cabinetId;

  Filosofy({
    required this.id,
    required this.logo,
    required this.label,
    required this.cabinetId,
  });

  factory Filosofy.fromJson(Map<String, dynamic> json) => Filosofy(
        id: json["id"],
        logo: json["logo"],
        label: json["label"],
        cabinetId: json["cabinet_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo": logo,
        "label": label,
        "cabinet_id": cabinetId,
      };
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
  int dbuId;
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
    required this.dbuId,
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
        dbuId: json["dbu_id"],
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
        "dbu_id": dbuId,
        "cabinet_id": cabinetId,
        "role_name": roleName,
      };
}

class Department {
  int id;
  String name;
  String shortName;
  String description;
  String logo;

  Department({
    required this.id,
    required this.name,
    required this.shortName,
    required this.description,
    required this.logo,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json["id"],
        name: json["name"],
        shortName: json["short_name"],
        description: json["description"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_name": shortName,
        "description": description,
        "logo": logo,
      };
}
