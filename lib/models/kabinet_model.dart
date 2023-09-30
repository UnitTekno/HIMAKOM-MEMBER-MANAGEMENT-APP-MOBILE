import 'dart:convert';

KabinetModel kabinetModelFromJson(String str) =>
    KabinetModel.fromJson(json.decode(str));

String kabinetModelToJson(KabinetModel data) => json.encode(data.toJson());

class KabinetModel {
  String status;
  List<Datum> data;

  KabinetModel({
    required this.status,
    required this.data,
  });

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
  int id;
  String name;
  String description;
  String visi;
  String misi;
  String logo;
  String filosofy;
  List<Filosofy> filosofies;

  Datum({
    required this.id,
    required this.name,
    required this.description,
    required this.visi,
    required this.misi,
    required this.logo,
    required this.filosofy,
    required this.filosofies,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        visi: json["visi"],
        misi: json["misi"],
        logo: json["logo"],
        filosofy: json["filosofy"],
        filosofies: List<Filosofy>.from(
            json["filosofies"].map((x) => Filosofy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "visi": visi,
        "misi": misi,
        "logo": logo,
        "filosofy": filosofy,
        "filosofies": List<dynamic>.from(filosofies.map((x) => x.toJson())),
      };
}

class Filosofy {
  int id;
  int cabinetId;
  String label;
  String logo;

  Filosofy({
    required this.id,
    required this.cabinetId,
    required this.label,
    required this.logo,
  });

  factory Filosofy.fromJson(Map<String, dynamic> json) => Filosofy(
        id: json["id"],
        cabinetId: json["cabinet_id"],
        label: json["label"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cabinet_id": cabinetId,
        "label": label,
        "logo": logo,
      };
}
