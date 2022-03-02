import 'dart:convert';

ProductDescriptionModel productDescriptionModelFromJson(String str) =>
    ProductDescriptionModel.fromJson(json.decode(str));

class ProductDescriptionModel {
  ProductDescriptionModel({
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
  int price;
  String category;
  int discountPrice;
  List<ProductImage> images;
  Review review;
  List<Product> products;

  factory ProductDescriptionModel.fromJson(Map<String, dynamic> json) {
    return ProductDescriptionModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      start: json["start"] ?? 0,
      price: json["price"] ?? 0,
      category: json["category"] ?? "",
      discountPrice: json["discount_price"] ?? 0,
      images: List<ProductImage>.from(
          json["images"].map((x) => ProductImage.fromJson(x))),
      review: Review.fromJson(json["review"]),
      products:
          List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );
  }
}

class ProductImage {
  ProductImage({
    required this.id,
    required this.image,
    required this.product,
  });

  int id;
  String image;
  int product;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
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
  });

  int id;
  String name;
  int start;
  int price;
  int discountPrice;
  ProductImage images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        start: json["start"] ?? 0,
        price: json["price"] ?? 0,
        discountPrice: json["discount_price"] ?? 0,
        images: ProductImage.fromJson(json["images"]),
      );
}

class Review {
  Review({
    required this.id,
    required this.name,
    required this.start,
    required this.text,
    required this.user,
    required this.propducts,
  });

  int id;
  String name;
  int start;
  String text;
  int user;
  int propducts;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        start: json["start"] ?? 0,
        text: json["text"] ?? 0,
        user: json["user"] ?? 0,
        propducts: json["propducts"] ?? 0,
      );
}
