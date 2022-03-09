import 'package:lafyu/src/model/api/super_sale_model.dart';
import 'package:lafyu/src/model/auth/http_result.dart';
import 'package:lafyu/src/model/super_flash_sale_model.dart';
import 'package:lafyu/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class SuperFlashSaleBloc {
  final Repository _repository = Repository();

  final _superFlashSaleFetch = PublishSubject<SuperFlashSaleModel>();
  final _superSaleFetch = PublishSubject<SuperSaleModel>();

  Stream<SuperSaleModel> get fetchSuperSale => _superSaleFetch.stream;

  Stream<SuperFlashSaleModel> get fetchSuperFlashSale =>
      _superFlashSaleFetch.stream;

  getSuperFlashSale() async {
    HttpResult response = await _repository.getSuperFlash();
    if (response.isSucces) {
      SuperFlashSaleModel data = SuperFlashSaleModel.fromJson(response.result);
      _superFlashSaleFetch.sink.add(data);
    }
  }

  getSuperSale(int id) async {
    HttpResult response = await _repository.getSuperSale(id);
    if (response.isSucces) {
      SuperSaleModel superSaleModel = SuperSaleModel.fromJson(response.result!);
      _superSaleFetch.sink.add(superSaleModel);
    }
  }
}

final superFlashSaleBloc = SuperFlashSaleBloc();
