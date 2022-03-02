class ProfileRegisterModel {
  ProfileRegisterModel({
    required this.password,
    required this.first_name,
    required this.confirm_password,
    required this.email,
  });

  String first_name;
  String email;
  String password;
  String confirm_password;

  factory ProfileRegisterModel.fromJson(Map<String, dynamic> json) =>
      ProfileRegisterModel(
        first_name: json["first_name"] ?? "",
        email: json["email"] ?? "",
        password: json["password"] ?? "",
        confirm_password: json["confirm_password"] ?? "",
      );
}
