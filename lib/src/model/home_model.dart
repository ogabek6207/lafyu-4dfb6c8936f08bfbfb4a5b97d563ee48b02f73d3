import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

class HomeModel {
  HomeModel({
    required this.count,
    required this.next,
    required this.results,
  });

  int count;
  String next;
  List<HomeResult> results;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        results: List<HomeResult>.from(
            json["results"].map((x) => HomeResult.fromJson(x))),
      );
}

class HomeResult {
  HomeResult({
    required this.id,
    required this.name,
    required this.start,
    required this.price,
    required this.discountPrice,
    required this.images,
  });

  int id;
  String name;
  int start;
  double price;
  double discountPrice;
  HomeSaleImages images;

  factory HomeResult.fromJson(Map<String, dynamic> json) {
    double price = 0.0;
    try {
      price = json["price"] ?? 0.0;
    } catch (_) {
      if (json["price"] != null) {
        price = json["price"].toDouble();
      }
    }

    double discountPrice = 0.0;
    try {
      discountPrice = json["discount_price"] ?? 0.0;
    } catch (_) {
      if (json["discount_price"] != null) {
        discountPrice = json["discount_price"].toDouble();
      }
    }

    return HomeResult(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      start: json["start"] ?? 0,
      price: price,
      discountPrice: discountPrice,
      images: HomeSaleImages.fromJson(json["images"]),
    );
  }
}

class HomeSaleImages {
  HomeSaleImages({
    required this.id,
    required this.image,
    required this.product,
  });

  int id;
  String image;
  int product;

  factory HomeSaleImages.fromJson(Map<String, dynamic> json) => HomeSaleImages(
        id: json["id"] ?? 0,
        image: json["image"] ?? "",
        product: json["product"] ?? 0,
      );
}
