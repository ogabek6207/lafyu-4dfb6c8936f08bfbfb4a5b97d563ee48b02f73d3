import 'dart:convert';

FlashSaleModel flashSaleModelFromJson(String str) =>
    FlashSaleModel.fromJson(json.decode(str));

class FlashSaleModel {
  FlashSaleModel({
    required this.count,
    required this.next,
    required this.results,
  });

  int count;
  String next;

  List<FlashSaleResult> results;

  factory FlashSaleModel.fromJson(Map<String, dynamic> json) => FlashSaleModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        results: List<FlashSaleResult>.from(
            json["results"].map((x) => FlashSaleResult.fromJson(x))),
      );
}

class FlashSaleResult {
  FlashSaleResult({
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
  int price;
  int discountPrice;
  List<FlashSaleImage> images;

  factory FlashSaleResult.fromJson(Map<String, dynamic> json) =>
      FlashSaleResult(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        start: json["start"] ?? 0,
        price: json["price"] ?? 0,
        discountPrice: json["discount_price"] ?? 0,
        images: List<FlashSaleImage>.from(
            json["images"].map((x) => FlashSaleImage.fromJson(x))),
      );
}

class FlashSaleImage {
  FlashSaleImage({
    required this.id,
    required this.image,
    required this.product,
  });

  int id;
  String image;
  int product;

  factory FlashSaleImage.fromJson(Map<String, dynamic> json) => FlashSaleImage(
        id: json["id"] ?? 0,
        image: json["image"] ?? "",
        product: json["product"] ?? 0,
      );
}
