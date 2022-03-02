class LoginModel {
  LoginModel({
    required this.status,
    required this.msg,
  });

  int status;
  String msg;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"] ?? 0,
    msg: json["msg"] ?? "",
  );
}
