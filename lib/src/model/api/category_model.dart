import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

class CategoryModel {
  CategoryModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String next;
  String previous;
  List<CategoryResult> results;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        previous: json["previous"] ?? "",
        results:
            List<CategoryResult>.from(json["results"].map((x) => CategoryResult.fromJson(x))),
      );
}

class CategoryResult {
  CategoryResult({
    required this.id,
    required this.childs,
    required this.name,
    required this.image,
    required this.genderTypes,
    required this.parent,
  });

  int id;
  List<dynamic> childs;
  String name;
  String image;
  int genderTypes;
  String parent;

  factory CategoryResult.fromJson(Map<String, dynamic> json) => CategoryResult(
        id: json["id"] ?? 0,
        childs: List<dynamic>.from(json["childs"].map((x) => x)),
        name: json["name"] ?? "",
        image: json["image"] ?? "",
        genderTypes: json["gender_types"] ?? 0,
        parent: json["parent"] ?? "",
      );
}
