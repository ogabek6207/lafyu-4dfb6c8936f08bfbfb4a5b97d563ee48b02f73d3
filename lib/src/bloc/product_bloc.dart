import 'package:rxdart/rxdart.dart';
import '../model/api/product_list_model.dart';
import '../model/api/product_model.dart';
import '../repository/repository_.dart';

class ProductBloc {
  final Repository _repository = Repository();
  final _productFetch = PublishSubject<ProductModel>();

  Stream<ProductModel> get fetchProduct => _productFetch.stream;

  getProductDescription(int id) async {
    var response = await _repository.getProductDescription(id);
    if (response.isSucces) {
      _productFetch.sink.add(ProductModel.fromJson(response.result!));
    }
  }


  dispose() {
    _productFetch.close();
  }
}

final productBloc = ProductBloc();
