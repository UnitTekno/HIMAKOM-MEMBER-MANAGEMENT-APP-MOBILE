import 'dart:convert';

KepengurusanModel kepengurusanModelFromJson(String str) =>
    KepengurusanModel.fromJson(json.decode(str));

String kepengurusanModelToJson(KepengurusanModel data) =>
    json.encode(data.toJson());

class KepengurusanModel {
  KepengurusanModel({
    required this.status,
    required this.data,
  });

  String status;
  List<Datum> data;

  factory KepengurusanModel.fromJson(Map<String, dynamic> json) =>
      KepengurusanModel(
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
    required this.name,
    required this.role,
    required this.avatar,
  });

  String name;
  String role;
  String avatar;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        role: json["role"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "role": role,
        "avatar": avatar,
      };
}
