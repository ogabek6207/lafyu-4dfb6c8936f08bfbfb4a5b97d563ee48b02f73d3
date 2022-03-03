import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.images,
    required this.reviewAvg,
    required this.reviewCount,
    required this.review,
    required this.products,
    required this.category,
  });

  int id;
  String name;
  int price;
  int discountPrice;
  List<Image> images;
  int reviewAvg;
  int reviewCount;
  Review review;
  List<Product> products;
  String category;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        price: json["price"] ?? 0,
        discountPrice: json["discount_price"] ?? 0,
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        reviewAvg: json["review_avg"] ?? 0,
        reviewCount: json["review_count"] ?? 0,
        review: Review.fromJson(json["review"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        category: json["category"] ?? "",
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

class Product {
  Product({
    required this.id,
    required this.name,
    required this.start,
    required this.price,
    required this.discountPrice,
    required this.images,
    required this.reviewAvg,
  });

  int id;
  String name;
  int start;
  int price;
  int discountPrice;
  Image images;
  dynamic reviewAvg;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        start: json["start"] ?? 0,
        price: json["price"] ?? 0,
        discountPrice: json["discount_price"] ?? 0,
        images: Image.fromJson(json["images"]),
        reviewAvg: json["review_avg"],
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
        date: json["date"] == null
            ? DateTime.now()
            : DateTime.parse(json["date"]),
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
