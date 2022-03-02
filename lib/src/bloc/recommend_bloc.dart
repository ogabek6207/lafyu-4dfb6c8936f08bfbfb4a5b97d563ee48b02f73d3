import 'package:lafyu/src/model/auth/http_result.dart';
import 'package:lafyu/src/model/recommend_model.dart';
import 'package:lafyu/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class RecommendBloc {
  final Repository _repository = Repository();

  final _recommendFetch = PublishSubject<RecommendModel>();

  Stream<RecommendModel> get fetchRecommend => _recommendFetch.stream;

  getRecommend() async {
    HttpResult response = await _repository.getRecommend();
    if (response.isSucces) {
      RecommendModel data = RecommendModel.fromJson(response.result);
      _recommendFetch.sink.add(data);
    }
  }
}

final recommendBloc = RecommendBloc();
