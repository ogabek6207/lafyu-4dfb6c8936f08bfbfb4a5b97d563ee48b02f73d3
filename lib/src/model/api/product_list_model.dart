class ProductListModel {
  ProductListModel({
    required this.count,
    required this.next,
    required this.results,
  });

  int count;
  String next;
  List<ProductListResult> results;

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        results: List<ProductListResult>.from(
            json["results"].map((x) => ProductListResult.fromJson(x))),
      );
}

class ProductListResult {
  ProductListResult({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.images,
    required this.reviewAvg,
  });

  int id;
  String name;
  double price;
  double reviewAvg;
  double discountPrice;
  ProductSaleImages images;

  factory ProductListResult.fromJson(Map<String, dynamic> json) {
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

    return ProductListResult(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      reviewAvg: json["review_avg"] ?? 0.0,
      price: price,
      discountPrice: discountPrice,
      images: ProductSaleImages.fromJson(json["images"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": images.image,
        "price": price,
        "review_avg": reviewAvg,
        "base_price": discountPrice,
      };
}

class ProductSaleImages {
  ProductSaleImages({
    required this.image,
  });

  String image;

  factory ProductSaleImages.fromJson(Map<String, dynamic> json) =>
      ProductSaleImages(
        image: json["image"] ?? "",
      );
}
