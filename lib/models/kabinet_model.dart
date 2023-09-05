import 'dart:convert';

KabinetModel kabinetModelFromJson(String str) =>
    KabinetModel.fromJson(json.decode(str));

String kabinetModelToJson(KabinetModel data) => json.encode(data.toJson());

class KabinetModel {
  KabinetModel({
    required this.status,
    required this.data,
  });

  String status;
  List<Datum> data;

  factory KabinetModel.fromJson(Map<String, dynamic> json) => KabinetModel(
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
    required this.description,
    required this.logo,
    required this.filosofy,
    required this.misi,
    required this.visi,
  });

  String name;
  String description;
  String logo;
  String filosofy;
  String visi;
  String misi;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        description: json["description"],
        logo: json["logo"],
        filosofy: json["filosofy"],
        visi: json["visi"],
        misi: json["misi"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "logo": logo,
        "filosofy": filosofy,
        "visi": visi,
        "misi": misi,
      };
}
