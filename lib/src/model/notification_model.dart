import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

class NotificationModel {
  NotificationModel({
    required this.id,
    required this.name,
    required this.text,
    required this.date,
    required this.notifationType,
  });

  int id;
  String name;
  String text;
  DateTime date;
  int notifationType;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        text: json["text"] ?? "",
        date: json["date"] == null
            ? DateTime.now()
            : DateTime.parse(json["date"]),
        notifationType: json["notifation_type"] ?? 0,
      );
}
