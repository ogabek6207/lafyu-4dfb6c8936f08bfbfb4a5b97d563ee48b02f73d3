class SuperFlashSaleModel {
  SuperFlashSaleModel({
    required this.count,
    required this.next,
    required this.results,
  });

  int count;
  String next;
  List<SuperFlashSaleResult> results;

  factory SuperFlashSaleModel.fromJson(Map<String, dynamic> json) => SuperFlashSaleModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        results: List<SuperFlashSaleResult>.from(
            json["results"].map((x) => SuperFlashSaleResult.fromJson(x))),
      );
}

class SuperFlashSaleResult {
  SuperFlashSaleResult({
    required this.id,
    required this.endDate,
    required this.image,
    required this.name,
    required this.percent,
  });

  int id;
  DateTime endDate;
  String image;
  String name;
  int percent;

  factory SuperFlashSaleResult.fromJson(Map<String, dynamic> json) => SuperFlashSaleResult(
        id: json["id"] ?? 0,
        endDate: json["end_date"] == null
            ? DateTime.now()
            : DateTime.parse(json["end_date"]),
        image: json["image"] ?? "",
        name: json["name"] ?? "",
        percent: json["percent"] ?? 0,
      );
}
