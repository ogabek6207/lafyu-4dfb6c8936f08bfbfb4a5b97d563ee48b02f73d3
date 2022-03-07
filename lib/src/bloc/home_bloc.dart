import 'package:lafyu/src/model/api/product_list_model.dart';
import 'package:lafyu/src/model/auth/http_result.dart';
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

  updateFavProduct(
    ProductListResult data,
  ) async {
    data.favSelected = !data.favSelected;
    if (data.favSelected) {
      await _repository.saveFavProducts(data);
      _update();
    } else {
      await _repository.deleteFavProducts(data.id);
      _update();
    }
  }

  _update() async {
    if (homeSale != null) {
      _homeSaleFetch.sink.add(await equalsDatabase(homeSale!));
    }
    if (flashSale != null) {
      _flashSaleFetch.sink.add(await equalsDatabase(flashSale!));
    }
    if (megaSale != null) {
      _megaSaleFetch.sink.add(await equalsDatabase(megaSale!));
    }
  }

  Future<ProductListModel> equalsDatabase(ProductListModel data) async {
    List<ProductListResult> favData = await _repository.getFavProduct();
    for (int i = 0; i < data.results.length; i++) {
      for (int j = 0; j < favData.length; j++) {
        if (data.results[i].id == favData[j].id) {
          data.results[i].favSelected = true;
        }
      }
    }
    return data;
  }

  ProductListModel? homeSale;

  getHomeSale() async {
    HttpResult response = await _repository.getProduct("true", "", "");
    if (response.isSucces) {
      homeSale = ProductListModel.fromJson(response.result);
      _homeSaleFetch.sink.add(await equalsDatabase(homeSale!));
    }
  }

  ProductListModel? flashSale;

  getFlashSale() async {
    HttpResult response = await _repository.getProduct("", "", "true");
    if (response.isSucces) {
      flashSale = ProductListModel.fromJson(response.result);
      _flashSaleFetch.sink.add(await equalsDatabase(flashSale!));
    }
  }

  ProductListModel? megaSale;

  getMegaSale() async {
    HttpResult response = await _repository.getProduct("", "true", "");
    if (response.isSucces) {
      megaSale = ProductListModel.fromJson(response.result);
      _megaSaleFetch.sink.add(await equalsDatabase(megaSale!));
    }
  }
}

final homeSaleBloc = HomeBloc();
