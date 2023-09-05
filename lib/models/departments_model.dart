
import 'dart:convert';

DepartmentsModel departmentsModelFromJson(String str) =>
    DepartmentsModel.fromJson(json.decode(str));

String departmentsModelToJson(DepartmentsModel data) =>
    json.encode(data.toJson());

class DepartmentsModel {
  DepartmentsModel({
    required this.status,
    required this.data,
  });

  String status;
  List<Datum> data;

  factory DepartmentsModel.fromJson(Map<String, dynamic> json) =>
      DepartmentsModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.shortName,
    this.description,
    required this.cabinetName,
    this.logo,
    required this.users,
    required this.programs,
  });

  int id;
  String name;
  String shortName;
  dynamic description;
  String cabinetName;
  dynamic logo;
  List<User> users;
  List<dynamic> programs;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        shortName: json["short_name"],
        description: json["description"],
        cabinetName: json["cabinet_name"],
        logo: json["logo"],
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
        programs: List<dynamic>.from(json["programs"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_name": shortName,
        "description": description,
        "cabinet_name": cabinetName,
        "logo": logo,
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "programs": List<dynamic>.from(programs.map((x) => x)),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.avatar,
    required this.role,
    required this.pivot,
  });

  int id;
  String name;
  String avatar;
  String role;
  Pivot pivot;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
        role: json["role"],
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar,
        "role": role,
        "pivot": pivot.toJson(),
      };
}

class Pivot {
  Pivot({
    required this.departmentId,
    required this.userId,
  });

  int departmentId;
  int userId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        departmentId: json["department_id"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "department_id": departmentId,
        "user_id": userId,
      };
}
