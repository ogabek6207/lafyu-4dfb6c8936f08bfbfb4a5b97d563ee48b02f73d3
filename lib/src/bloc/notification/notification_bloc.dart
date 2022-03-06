import 'package:lafyu/src/model/auth/http_result.dart';
import 'package:lafyu/src/model/notification_model.dart';
import 'package:lafyu/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class NotificationBloc {
  final Repository _repository = Repository();

  final _notificationFetch = PublishSubject<NotificationModel>();

  Stream<NotificationModel> get fetchNotification => _notificationFetch.stream;

  getNotification(int id) async {
    HttpResult response = await _repository.getNotification(id);
    if (response.isSucces) {
      NotificationModel data = NotificationModel.fromJson(response.result);
      _notificationFetch.sink.add(data);
    }
  }
}

final notificationBloc = NotificationBloc();
