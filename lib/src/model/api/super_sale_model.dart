import 'dart:convert';

import 'package:lafyu/src/model/api/product_list_model.dart';

SuperSaleModel superSaleModelFromJson(String str) =>
    SuperSaleModel.fromJson(json.decode(str));

class SuperSaleModel {
  SuperSaleModel({
    required this.id,
    required this.product,
    required this.endDate,
    required this.image,
    required this.name,
    required this.percent,
  });

  int id;
  List<ProductListResult> product;
  DateTime endDate;
  String image;
  String name;
  int percent;

  factory SuperSaleModel.fromJson(Map<String, dynamic> json) => SuperSaleModel(
        id: json["id"] ?? 0,
        product:
            List<ProductListResult>.from(json["product"].map((x) => ProductListResult.fromJson(x))),
        endDate: json["end_date"] == null
            ? DateTime.now()
            : DateTime.parse(json["end_date"]),
        image: json["image"] ?? "",
        name: json["name"] ?? "",
        percent: json["percent"] ?? 0,
      );
}



class Images {
  Images({
    required this.id,
    required this.image,
    required this.product,
  });

  int id;
  String image;
  int product;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["id"] ?? 0,
        image: json["image"] ?? "",
        product: json["product"] ?? 0,
      );
}
