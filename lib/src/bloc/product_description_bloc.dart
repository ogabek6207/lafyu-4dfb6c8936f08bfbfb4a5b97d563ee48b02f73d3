import 'package:rxdart/rxdart.dart';
import '../model/product_description_model.dart';
import '../repository/repository_.dart';

class ProductDescriptionBloc {
  final Repository _repository = Repository();
  final productDescriptionFetch = PublishSubject<ProductDescriptionModel>();

  Stream<ProductDescriptionModel> get fetchProductDescription =>
      productDescriptionFetch.stream;

  getProductDescription(int id) async {
    var response = await _repository.getProductDescription(id);
    if (response.isSucces) {
      ProductDescriptionModel productDescriptionModel =
          ProductDescriptionModel.fromJson(response.result);
      productDescriptionFetch.sink.add(productDescriptionModel);
    }
  }

  dispose() {
    productDescriptionFetch.close();
  }
}

final productDescriptionBloc = ProductDescriptionBloc();
