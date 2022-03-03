import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.start,
    required this.price,
    required this.discountPrice,
    required this.images,
    required this.review,
    required this.products,
    required this.category,
  });

  int id;
  String name;
  int start;
  int price;
  int discountPrice;
  List<Image> images;
  dynamic review;
  List<Product> products;
  String category;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        start: json["start"] ?? 0,
        price: json["price"] ?? 0,
        discountPrice: json["discount_price"] ??  0,
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        review: json["review"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        category: json["category"],
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
        id: json["id"],
        image: json["image"],
        product: json["product"],
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
  });

  int id;
  String name;
  int start;
  int price;
  int discountPrice;
  Image images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        start: json["start"],
        price: json["price"],
        discountPrice: json["discount_price"],
        images: Image.fromJson(json["images"]),
      );
}
