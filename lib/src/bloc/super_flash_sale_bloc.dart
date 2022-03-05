import 'package:lafyu/src/model/auth/http_result.dart';
import 'package:lafyu/src/model/super_flash_sale_model.dart';
import 'package:lafyu/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class SuperFlashSaleBloc {
  final Repository _repository = Repository();

  final _superFlashSaleFetch = PublishSubject<SuperFlashSaleModel>();
  // final _superFlashSaleFetchCategory =
  //     PublishSubject<SuperFlashSaleCategoryModel>();

  Stream<SuperFlashSaleModel> get fetchSuperFlashSale =>
      _superFlashSaleFetch.stream;

  // Stream<SuperFlashSaleCategoryModel> get fetchSuperFlashSaleCategory =>
  //     _superFlashSaleFetchCategory.stream;

  getSuperFlashSale() async {
    HttpResult response = await _repository.getSuperFlash();
    if (response.isSucces) {
      SuperFlashSaleModel data = SuperFlashSaleModel.fromJson(response.result);
      _superFlashSaleFetch.sink.add(data);
    }
  }

  // getSuperFlashSaleCategory(int id) async {
  //   HttpResult response = await _repository.getSuperFlashCategory(id);
  //   if (response.isSucces) {
  //     SuperFlashSaleCategoryModel data =
  //         SuperFlashSaleCategoryModel.fromJson(response.result);
  //     _superFlashSaleFetchCategory.sink.add(data);
  //   }
  // }
}

final superFlashSaleBloc = SuperFlashSaleBloc();
