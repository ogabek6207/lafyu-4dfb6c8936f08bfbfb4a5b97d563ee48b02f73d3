import 'dart:convert';

NotificationTypeModel notificationTypeModelFromJson(String str) =>
    NotificationTypeModel.fromJson(json.decode(str));

class NotificationTypeModel {
  NotificationTypeModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<NotificationTypeResult> results;

  factory NotificationTypeModel.fromJson(Map<String, dynamic> json) =>
      NotificationTypeModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<NotificationTypeResult>.from(json["results"].map((x) => NotificationTypeResult.fromJson(x))),
      );
}

class NotificationTypeResult {
  NotificationTypeResult({
    required this.id,
    required this.image,
    required this.name,
  });

  int id;
  String image;
  String name;

  factory NotificationTypeResult.fromJson(Map<String, dynamic> json) => NotificationTypeResult(
        id: json["id"],
        image: json["image"],
        name: json["name"],
      );
}
