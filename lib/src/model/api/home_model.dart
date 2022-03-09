import 'package:lafyu/src/model/api/product_list_model.dart';
import 'package:lafyu/src/model/api/recommend_model.dart';

class HomeModel {
  List<ProductListResult> flashSale;
  List<ProductListResult> megaSale;
  List<ProductListResult> homeSale;
  List<RecommendResult> recomended;

  HomeModel({
    required this.flashSale,
    required this.megaSale,
    required this.homeSale,
    required this.recomended,
  });
}
