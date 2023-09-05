import 'dart:convert';

EventsModel eventsModelFromJson(String str) =>
    EventsModel.fromJson(json.decode(str));

class EventsModel {
  String status;
  List<Events> events;

  EventsModel({required this.status, required this.events});

  factory EventsModel.fromJson(Map<String, dynamic> json) {
    return EventsModel(
        status: json['status'],
        events: List<Events>.from(json['data'].map((x) => Events.fromJson(x))));
  }
}

class Events {
  int id;
  String poster;
  String name;
  String description;
  DateTime date;
  String time;
  String location;
  String type;

  Events(
      {required this.id,
      required this.poster,
      required this.name,
      required this.description,
      required this.date,
      required this.time,
      required this.location,
      required this.type});

  factory Events.fromJson(Map<String, dynamic> json) {
    return Events(
        id: json['id'],
        poster: json['poster'],
        name: json['name'],
        description: json['description'],
        date: DateTime.parse(json['date']),
        time: json['time'],
        location: json['location'],
        type: json['type']);
  }
}
