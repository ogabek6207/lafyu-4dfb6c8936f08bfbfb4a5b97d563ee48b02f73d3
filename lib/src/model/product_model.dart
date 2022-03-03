import 'package:lafyu/src/model/home_model.dart';

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
  double price;
  double discountPrice;
  List<ImageResults> images;
  double reviewAvg;
  int reviewCount;
  Review review;
  List<HomeResult> products;
  String category;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        price: json["price"] ?? 0.0,
        discountPrice: json["discount_price"] ?? 0.0,
        images: List<ImageResults>.from(json["images"].map((x) => ImageResults.fromJson(x))),
        reviewAvg: json["review_avg"] ?? 0.0,
        reviewCount: json["review_count"] ?? 0,
        review: Review.fromJson(json["review"]),
        products: List<HomeResult>.from(
            json["products"].map((x) => HomeResult.fromJson(x))),
        category: json["category"] ?? "",
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
