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
  List<SuperFlashSaleProduct> product;
  DateTime endDate;
  String image;
  String name;
  int percent;

  factory SuperFlashSaleCategoryModel.fromJson(Map<String, dynamic> json) =>
      SuperFlashSaleCategoryModel(
        id: json["id"] ?? 0,
        product: List<SuperFlashSaleProduct>.from(
            json["product"].map((x) => SuperFlashSaleProduct.fromJson(x))),
        endDate: json["end_date"] == null
            ? DateTime.now()
            : DateTime.parse(json["end_date"]),
        image: json["image"] ?? "",
        name: json["name"] ?? "",
        percent: json["percent"] ?? 0,
      );
}

class SuperFlashSaleProduct {
  SuperFlashSaleProduct({
    required this.id,
    required this.name,
    required this.start,
    required this.price,
    required this.discountPrice,
    required this.images,
    required this.review,
    required this.reviewAvg,
  });

  int id;
  String name;
  int start;
  double price;
  double discountPrice;
  List<Image> images;
  Review review;
  int reviewAvg;

  factory SuperFlashSaleProduct.fromJson(Map<String, dynamic> json) =>
      SuperFlashSaleProduct(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        start: json["start"] ?? 0,
        price: json["price"] ?? 0.0,
        discountPrice: json["discount_price"] ?? 0.0,
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        review: Review.fromJson(json["review"]),
        reviewAvg: json["review_avg"] ?? 0,
      );
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

class Review {
  Review({
    required this.user,
    required this.text,
    required this.date,
    required this.images,
  });

  User user;
  String text;
  DateTime date;
  Images images;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        user: User.fromJson(json["user"]),
        text: json["text"] ?? "",
        date: json["end_date"] == null
            ? DateTime.now()
            : DateTime.parse(json["end_date"]),
        images: Images.fromJson(json["images"]),
      );
}

class Images {
  Images({
    required this.id,
    required this.image,
    required this.reviews,
  });

  int id;
  String image;
  int reviews;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["id"] ?? 0,
        image: json["image"] ?? "",
        reviews: json["reviews"] ?? 0,
      );
}

class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  dynamic firstName;
  dynamic lastName;
  String avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        avatar: json["avatar"] ?? "",
      );
}
