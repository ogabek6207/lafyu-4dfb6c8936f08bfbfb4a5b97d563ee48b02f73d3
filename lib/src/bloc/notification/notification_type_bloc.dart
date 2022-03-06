import 'package:lafyu/src/model/auth/http_result.dart';
import 'package:lafyu/src/model/notification/notification_type_model.dart';
import 'package:lafyu/src/repository/repository_.dart';
import 'package:rxdart/rxdart.dart';

class NotificationTypeBloc {
  final Repository _repository = Repository();

  final _notificationTypeFetch = PublishSubject<NotificationTypeModel>();

  Stream<NotificationTypeModel> get fetchNotificationType =>
      _notificationTypeFetch.stream;

  getNotificationType() async {
    HttpResult response = await _repository.getNotificationType();
    if (response.isSucces) {
      NotificationTypeModel data =
          NotificationTypeModel.fromJson(response.result);
      _notificationTypeFetch.sink.add(data);
    }
  }
}

final notificationTypeBloc = NotificationTypeBloc();
