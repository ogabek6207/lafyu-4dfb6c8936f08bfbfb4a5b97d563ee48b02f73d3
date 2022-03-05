import 'package:lafyu/src/model/auth/http_result.dart';
import 'package:lafyu/src/model/api/category_model.dart';
import 'package:lafyu/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class CategoryBloc {
  final Repository _repository = Repository();

  final _categoryFetch = PublishSubject<CategoryModel>();

  Stream<CategoryModel> get fetchCategory => _categoryFetch.stream;

  getCategory() async {
    HttpResult response = await _repository.getCategory();
    if (response.isSucces) {
      CategoryModel data = CategoryModel.fromJson(response.result);
      _categoryFetch.sink.add(data);
    }
  }
}

final categoryBloc = CategoryBloc();
