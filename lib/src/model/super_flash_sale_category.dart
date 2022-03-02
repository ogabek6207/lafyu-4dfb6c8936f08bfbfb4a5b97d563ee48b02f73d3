import 'dart:convert';

SuperFlashSaleCategoryModel superFlashSaleCategoryModelFromJson(String str) =>
    SuperFlashSaleCategoryModel.fromJson(json.decode(str));

class SuperFlashSaleCategoryModel {
  SuperFlashSaleCategoryModel({
    required this.id,
    required this.product,
    required this.endDate,
    required this.image,
    required this.name,
    required this.percent,
  });

  int id;
  List<SuperFlashSaleCategoryResult> product;
  DateTime endDate;
  String image;
  String name;
  int percent;

  factory SuperFlashSaleCategoryModel.fromJson(Map<String, dynamic> json) =>
      SuperFlashSaleCategoryModel(
        id: json["id"] ?? 0,
        product: List<SuperFlashSaleCategoryResult>.from(json["product"]
            .map((x) => SuperFlashSaleCategoryResult.fromJson(x))),
        endDate: json["end_date"] == null
            ? DateTime.now()
            : DateTime.parse(json["end_date"]),
        image: json["image"] ?? "",
        name: json["name"] ?? "",
        percent: json["percent"] ?? 0,
      );
}

class SuperFlashSaleCategoryResult {
  SuperFlashSaleCategoryResult({
    required this.id,
    required this.name,
    required this.start,
    required this.price,
    required this.category,
    required this.discountPrice,
    required this.images,
    required this.review,
    required this.products,
  });

  int id;
  String name;
  int start;
  double price;
  String category;
  double discountPrice;
  List<Image> images;
  Review review;
  List<ProductProduct> products;

  factory SuperFlashSaleCategoryResult.fromJson(Map<String, dynamic> json) {
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

    return SuperFlashSaleCategoryResult(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      start: json["start"] ?? 0,
      price: price,
      category: json["category"] ?? "",
      discountPrice: discountPrice,
      images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      review: Review.fromJson(json["review"]),
      products: List<ProductProduct>.from(
          json["products"].map((x) => ProductProduct.fromJson(x))),
    );
  }
}

class Image {
  Image({
    required this.id,
    required this.image,
    required this.product,
  });

  int id;
  String image;
  int product;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"] ?? 0,
        image: json["image"] ?? "",
        product: json["product"] ?? 0,
      );
}

class ProductProduct {
  ProductProduct({
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
  Image images;

  factory ProductProduct.fromJson(Map<String, dynamic> json) {
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

    return ProductProduct(
      id: json["id"] ?? 0,
      name: json["name"],
      start: json["start"] ?? 0,
      price: price,
      discountPrice: discountPrice,
      images: Image.fromJson(json["images"]),
    );
  }
}

class Review {
  Review({
    required this.start,
    required this.user,
    required this.text,
    required this.date,
  });

  int start;
  int user;
  String text;
  DateTime date;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        start: json["start"] ?? 0,
        user: json["user"] ?? 0,
        text: json["text"] ?? 0,
        date: json["date"] == null
            ? DateTime.now()
            : DateTime.parse(json["date"]),
      );
}
