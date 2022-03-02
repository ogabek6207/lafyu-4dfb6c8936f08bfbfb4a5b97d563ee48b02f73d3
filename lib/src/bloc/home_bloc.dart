import 'package:lafyu/src/model/auth/http_result.dart';
import 'package:lafyu/src/model/home_model.dart';
import 'package:lafyu/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final Repository _repository = Repository();

  final _homeSaleFetch = PublishSubject<HomeModel>();
  final _megaSaleFetch = PublishSubject<HomeModel>();
  final _flashSaleFetch = PublishSubject<HomeModel>();

  Stream<HomeModel> get fetchHomeSale => _homeSaleFetch.stream;

  Stream<HomeModel> get fetchMegaSale => _megaSaleFetch.stream;

  Stream<HomeModel> get fetchFlashSale => _flashSaleFetch.stream;

  getHomeSale() async {
    HttpResult response = await _repository.getProduct(true, false, false);
    if (response.isSucces) {
      HomeModel data = HomeModel.fromJson(response.result);
      _homeSaleFetch.sink.add(data);
    }
  }

  getFlashSale() async {
    HttpResult response = await _repository.getProduct(false, false, true);
    if (response.isSucces) {
      HomeModel data = HomeModel.fromJson(response.result);
      _flashSaleFetch.sink.add(data);
    }
  }

  getMegaSale() async {
    HttpResult response = await _repository.getProduct(false, true, false);
    if (response.isSucces) {
      HomeModel data = HomeModel.fromJson(response.result);
      _flashSaleFetch.sink.add(data);
    }
  }
}

final homeSaleBloc = HomeBloc();
