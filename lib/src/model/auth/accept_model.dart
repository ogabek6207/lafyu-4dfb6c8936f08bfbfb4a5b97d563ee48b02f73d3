class AcceptModel {
  AcceptModel({
    required this.status,
    required this.msg,
    required this.user,
    required this.token,
  });

  int status;
  String msg;
  AcceptUser user;
  String token;

  factory AcceptModel.fromJson(Map<String, dynamic> json) => AcceptModel(
    status: json["status"] ?? 0,
    msg: json["msg"] ?? "",
    user: json["user"] == null
        ? AcceptUser.fromJson({})
        : AcceptUser.fromJson(json["user"]),
    token: json["token"] ?? "",
  );
}

class AcceptUser {
  AcceptUser({
    required this.id,
    required this.login,
    required this.avatar,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.birthDate,
    required this.complete,
  });

  int id;
  String login;
  String avatar;
  String firstName;
  String lastName;
  String gender;
  String birthDate;
  int complete;

  factory AcceptUser.fromJson(Map<String, dynamic> json) => AcceptUser(
    id: json["id"] ?? 0,
    login: json["login"] ?? "",
    avatar: json["avatar"] ?? "",
    firstName: json["first_name"] ?? "",
    lastName: json["last_name"] ?? "",
    gender: json["gender"] ?? "",
    birthDate: json["birth_date"] ?? "",
    complete: json["complete"] ?? 0,
  );
}
