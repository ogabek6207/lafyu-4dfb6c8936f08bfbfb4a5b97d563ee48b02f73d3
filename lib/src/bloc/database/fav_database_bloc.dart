import 'package:lafyu/src/model/api/product_list_model.dart';
import 'package:lafyu/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class FavDatabaseBloc {
  final Repository _repository = Repository();
  final productFavFetch = PublishSubject<List<ProductListResult>>();
  final productFetch = PublishSubject<ProductListModel>();
  final _categoryFetch = PublishSubject<List<ProductListResult>>();

  Stream<List<ProductListResult>> get fetchCategory => _categoryFetch.stream;
  ProductListModel? result;

  ///fav
  getDrugsFav() async {
    List<ProductListResult> database = await _repository.getFavProduct();
    productFavFetch.sink.add(database);
  }

  updateFavDrugs(
    ProductListResult data,
    bool like,
  ) async {
    for (int i = 0; i < result!.results.length; i++) {
      if (result!.results[i].id == data.id) {
        result!.results[i].favSelected = like;
        break;
      }
    }
    if (like) {
      _repository.saveFavProducts(data);
    } else {
      _repository.deleteFavProducts(data.id);
    }
    List<ProductListResult> database = await _repository.getFavProduct();
    productFetch.sink.add(result!);
    productFavFetch.sink.add(database);
  }
}

final categoryBloc = FavDatabaseBloc();
