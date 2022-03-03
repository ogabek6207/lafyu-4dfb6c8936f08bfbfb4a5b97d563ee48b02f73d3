
import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import '../model/product_model.dart';
import '../repository/repository_.dart';

class ProductBloc {
  final Repository _repository = Repository();
  final productFetch = PublishSubject<ProductModel>();

  Stream<ProductModel> get fetchProduct =>
      productFetch.stream;

  getProductDescription(int id) async {
    var response = await _repository.getProductDescription(id);
    if (response.isSucces) {
      var productModel = productModelFromJson(json.encode(response.result));
      productFetch.sink.add(productModel);
    }
  }

  dispose() {
    productFetch.close();
  }
}

final productBloc = ProductBloc();
