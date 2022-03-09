import 'product_list_model.dart';

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.images,
    required this.color,
    required this.size,
    required this.reviewAvg,
    required this.reviewCount,
    required this.review,
    required this.products,
    required this.category,
  });

  int id;
  String name;
  double price;
  double discountPrice;
  List<ImageResults> images;
  List<ColorResult> color;
  List<Size> size;
  double reviewAvg;
  int reviewCount;
  Review review;
  List<ProductListResult> products;
  String category;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
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
    return ProductModel(
      id: json["id"],
      name: json["name"],
      price: price,
      discountPrice: discountPrice,
      images: List<ImageResults>.from(
          json["images"].map((x) => ImageResults.fromJson(x))),
      color: List<ColorResult>.from(
          json["color"].map((x) => ColorResult.fromJson(x))),
      size: List<Size>.from(json["size"].map((x) => Size.fromJson(x))),
      reviewAvg: json["review_avg"] ?? 0,
      reviewCount: json["review_count"] ?? 0,
      review: json["review"] == null
          ? Review.fromJson({})
          : Review.fromJson(json["review"]),
      products: json["products"] == null
          ? <ProductListResult>[]
          : List<ProductListResult>.from(
              json["products"].map((x) => ProductListResult.fromJson(x))),
      category: json["category"],
    );
  }
}

class ColorResult {
  ColorResult({
    required this.id,
    required this.color,
  });

  int id;
  String color;

  factory ColorResult.fromJson(Map<String, dynamic> json) => ColorResult(
        id: json["id"] ?? 0,
        color: json["color"] ?? "FFFFFF",
      );
}

class ImageResults {
  ImageResults({
    required this.id,
    required this.image,
    required this.product,
  });

  int id;
  String image;
  int product;

  factory ImageResults.fromJson(Map<String, dynamic> json) => ImageResults(
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
        user: json["user"] == null
            ? User.fromJson({})
            : User.fromJson(json["user"]),
        text: json["text"] ?? "",
        date: json["date"] == null
            ? DateTime.now()
            : DateTime.parse(json["date"]),
        images: json["images"] == null
            ? Images.fromJson({})
            : Images.fromJson(json["images"]),
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

  String firstName;
  String lastName;
  String avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        avatar: json["avatar"] ?? "",
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
        id: json["id"] ?? 0,
        size: json["size"] ?? "",
      );
}
