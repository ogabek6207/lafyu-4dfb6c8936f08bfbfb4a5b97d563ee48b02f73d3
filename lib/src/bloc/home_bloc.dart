import 'package:lafyu/src/model/auth/http_result.dart';
import 'package:lafyu/src/model/api/product_list_model.dart';
import 'package:lafyu/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final Repository _repository = Repository();

  final _homeSaleFetch = PublishSubject<ProductListModel>();
  final _megaSaleFetch = PublishSubject<ProductListModel>();
  final _flashSaleFetch = PublishSubject<ProductListModel>();

  Stream<ProductListModel> get fetchHomeSale => _homeSaleFetch.stream;

  Stream<ProductListModel> get fetchMegaSale => _megaSaleFetch.stream;

  Stream<ProductListModel> get fetchFlashSale => _flashSaleFetch.stream;

  getHomeSale() async {
    HttpResult response = await _repository.getProduct("true", "", "");
    if (response.isSucces) {
      ProductListModel data = ProductListModel.fromJson(response.result);
      _homeSaleFetch.sink.add(data);
    }
  }

  getFlashSale() async {
    HttpResult response = await _repository.getProduct("", "", "true");
    if (response.isSucces) {
      ProductListModel data = ProductListModel.fromJson(response.result);
      _flashSaleFetch.sink.add(data);
    }
  }

  getMegaSale() async {
    HttpResult response = await _repository.getProduct("", "true", "");
    if (response.isSucces) {
      ProductListModel data = ProductListModel.fromJson(response.result);
      _flashSaleFetch.sink.add(data);
    }
  }
}

final homeSaleBloc = HomeBloc();
