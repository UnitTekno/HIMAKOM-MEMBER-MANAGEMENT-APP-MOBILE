// To parse this JSON data, do
//
//     final pushNotification = pushNotificationFromJson(jsonString);

import 'dart:convert';

PushNotification pushNotificationFromJson(String str) =>
    PushNotification.fromJson(json.decode(str));

String pushNotificationToJson(PushNotification data) =>
    json.encode(data.toJson());

class PushNotification {
  String status;
  List<DataNotif> data;

  PushNotification({
    required this.status,
    required this.data,
  });

  factory PushNotification.fromJson(Map<String, dynamic> json) =>
      PushNotification(
        status: json["status"],
        data: List<DataNotif>.from(
            json["data"].map((x) => DataNotif.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataNotif {
  int id;
  String title;
  String body;
  String link;
  String poster;

  DataNotif({
    required this.id,
    required this.title,
    required this.body,
    required this.link,
    required this.poster,
  });

  factory DataNotif.fromJson(Map<String, dynamic> json) => DataNotif(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        link: json["link"],
        poster: json["poster"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "link": link,
        "poster": poster,
      };
}
