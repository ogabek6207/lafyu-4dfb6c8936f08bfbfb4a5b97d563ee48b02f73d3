import 'package:lafyu/src/model/api/product_list_model.dart';

class FavDatabaseModel {
  FavDatabaseModel({
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
  ProductSaleImages images;

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": images,
        "price": price,
        "start": start,
        "base_price": discountPrice,
      };
}
