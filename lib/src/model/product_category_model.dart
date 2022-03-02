import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

class ProductModel {
  ProductModel({
    required this.id,
    required this.produts,
    required this.endDate,
    required this.image,
    required this.name,
    required this.percent,
  });

  int id;
  List<Produt> produts;
  DateTime endDate;
  String image;
  String name;
  int percent;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"] ?? 0,
        produts:
            List<Produt>.from(json["produts"].map((x) => Produt.fromJson(x))),
        endDate: json["end_date"] == null
            ? DateTime.now()
            : DateTime.parse(json["end_date"]),
        image: json["image"] ?? "",
        name: json["name"] ?? "",
        percent: json["percent"] ?? 0,
      );
}

class Produt {
  Produt({
    required this.id,
    required this.images,
    required this.size,
    required this.color,
    required this.name,
    required this.start,
    required this.price,
    required this.discountPrice,
    required this.specification,
    required this.flashSale,
    required this.megaSale,
    required this.homeSale,
    required this.category,
  });

  int id;
  List<Image> images;
  List<Size> size;
  List<Color> color;
  String name;
  int start;
  String price;
  String discountPrice;
  String specification;
  bool flashSale;
  bool megaSale;
  bool homeSale;
  int category;

  factory Produt.fromJson(Map<String, dynamic> json) => Produt(
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        size: List<Size>.from(json["size"].map((x) => Size.fromJson(x))),
        color: List<Color>.from(json["color"].map((x) => Color.fromJson(x))),
        name: json["name"],
        start: json["start"],
        price: json["price"] == null ? null : json["price"],
        discountPrice: json["discount_price"],
        specification: json["Specification"],
        flashSale: json["flash_sale"],
        megaSale: json["mega_sale"],
        homeSale: json["home_sale"],
        category: json["category"],
      );
}

class Color {
  Color({
    required this.id,
    required this.color,
  });

  int id;
  String color;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json["id"],
        color: json["color"],
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

class Size {
  Size({
    required this.id,
    required this.size,
  });

  int id;
  String size;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        id: json["id"],
        size: json["size"],
      );
}
