import 'package:lafyu/src/model/api/home_model.dart';
import 'package:lafyu/src/model/api/product_list_model.dart';
import 'package:lafyu/src/model/api/recommend_model.dart';
import 'package:lafyu/src/model/auth/http_result.dart';
import 'package:lafyu/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final Repository _repository = Repository();

  final _productFetch = PublishSubject<List<ProductListResult>>();
  final _homeData = PublishSubject<HomeModel>();

  Stream<HomeModel> get getHomeData => _homeData.stream;

  Stream<List<ProductListResult>> get fetchProduct => _productFetch.stream;

  HomeModel data = HomeModel(
    flashSale: ProductListModel.fromJson({}).results,
    megaSale: ProductListModel.fromJson({}).results,
    homeSale: ProductListModel.fromJson({}).results,
    recomended: RecommendModel.fromJson({}).results,
  );

  allHomeData() async {
    HttpResult responseFlash = await _repository.getProduct("", "", "true");

    if (responseFlash.isSucces) {
      data.flashSale = await equalsDatabase(
        ProductListModel.fromJson(responseFlash.result).results,
      );
      _homeData.sink.add(data);
    }
    HttpResult megaSale = await _repository.getProduct("", "true", "");
    if (megaSale.isSucces) {
      data.megaSale = await equalsDatabase(
        ProductListModel.fromJson(megaSale.result).results,
      );
      _homeData.sink.add(data);
    }
    HttpResult redData = await _repository.getRecommend();
    if (redData.isSucces) {
      RecommendModel rec = RecommendModel.fromJson(redData.result);
      data.recomended = rec.results;
      _homeData.sink.add(data);
    }

    HttpResult responseHome = await _repository.getProduct("true", "", "");
    if (responseHome.isSucces) {
      data.homeSale = await equalsDatabase(
        ProductListModel.fromJson(responseHome.result).results,
      );
      _homeData.sink.add(data);
    }
  }

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
    data.homeSale = await equalsDatabase(data.homeSale);
    data.megaSale = await equalsDatabase(data.megaSale);
    data.flashSale = await equalsDatabase(data.flashSale);
    _homeData.sink.add(data);
  }

  getDataBaseProduct() async {
    List<ProductListResult> database = await _repository.getFavProduct();
    _productFetch.sink.add(database);
  }

  getProduct(int type) async {
    // if (type == 1) {
    //   {
    //     HttpResult response = await _repository.getProduct("", "", "true");
    //     if (response.isSucces) {
    //       _flashSale = ProductListModel.fromJson(response.result);
    //       _flashSaleFetch.sink.add(await equalsDatabase(_flashSale!));
    //     }
    //   }
    // } else if (type == 2) {
    //   {
    //     HttpResult response = await _repository.getProduct("", "true", "");
    //     if (response.isSucces) {
    //       _megaSale = ProductListModel.fromJson(response.result);
    //       _megaSaleFetch.sink.add(await equalsDatabase(_megaSale!));
    //     }
    //   }
    // } else if (type == 3) {
    //   {
    //     HttpResult response = await _repository.getProduct("true", "", "");
    //     if (response.isSucces) {
    //       _homeSale = ProductListModel.fromJson(response.result);
    //       _homeSaleFetch.sink.add(await equalsDatabase(_homeSale!));
    //     }
    //   }
    // }
  }

  Future<List<ProductListResult>> equalsDatabase(
      List<ProductListResult> data) async {
    List<ProductListResult> favData = await _repository.getFavProduct();
    for (int i = 0; i < data.length; i++) {
      data[i].favSelected = false;
    }
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < favData.length; j++) {
        if (data[i].id == favData[j].id) {
          data[i].favSelected = true;
          break;
        }
      }
    }
    return data;
  }
}

final homeSaleBloc = HomeBloc();
