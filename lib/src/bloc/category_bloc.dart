import 'package:lafyu/src/model/auth/http_result.dart';
import 'package:lafyu/src/model/api/category_model.dart';
import 'package:lafyu/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class CategoryBloc {
  final Repository _repository = Repository();

  final _categoryFetch = PublishSubject<CategoryModel>();
  final _categoryTypeFetch = PublishSubject<CategoryType>();

  Stream<CategoryModel> get fetchCategory => _categoryFetch.stream;

  Stream<CategoryType> get fetchCategoryType => _categoryTypeFetch.stream;

  getCategoryType() async {
    HttpResult response = await _repository.getCategory();
    if (response.isSucces) {
      CategoryModel data = CategoryModel.fromJson(response.result);
      List<CategoryResult> man = [];
      List<CategoryResult> woman = [];
      List<CategoryResult> kids = [];
      for (int i = 0; i < data.results.length; i++) {
        if (data.results[i].genderTypes == 1) {
          man.add(data.results[i]);
        } else if (data.results[i].genderTypes == 2) {
          woman.add(data.results[i]);
        } else if (data.results[i].genderTypes == 3) {
          kids.add(data.results[i]);
        }
      }
      _categoryTypeFetch.sink.add(
        CategoryType(man: man, woman: woman, kids: kids),
      );
    }
  }

  getCategory() async {
    HttpResult response = await _repository.getCategory();
    if (response.isSucces) {
      CategoryModel data = CategoryModel.fromJson(response.result);
      _categoryFetch.sink.add(data);
    }
  }
}

final categoryBloc = CategoryBloc();
