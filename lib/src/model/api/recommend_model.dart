import 'dart:convert';

RecommendModel recommendModelFromJson(String str) =>
    RecommendModel.fromJson(json.decode(str));

class RecommendModel {
  RecommendModel({
    required this.count,
    required this.next,
    required this.results,
  });

  int count;
  dynamic next;
  List<RecommendResult> results;

  factory RecommendModel.fromJson(Map<String, dynamic> json) => RecommendModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        results: json["results"] == null
            ? <RecommendResult>[]
            : List<RecommendResult>.from(
                json["results"].map((x) => RecommendResult.fromJson(x))),
      );
}

class RecommendResult {
  RecommendResult({
    required this.id,
    required this.image,
    required this.name,
    required this.title,
    required this.product,
  });

  int id;
  String image;
  String name;
  String title;
  int product;

  factory RecommendResult.fromJson(Map<String, dynamic> json) =>
      RecommendResult(
        id: json["id"] ?? 0,
        image: json["image"] ?? "",
        name: json["name"] ?? "",
        title: json["title"] ?? "",
        product: json["product"] ?? 0,
      );
}
