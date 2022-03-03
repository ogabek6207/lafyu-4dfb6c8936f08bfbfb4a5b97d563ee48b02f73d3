class ProfileRegisterModel {
  ProfileRegisterModel({
    required this.password,
    required this.firstName,
    required this.confirmPassword,
    required this.email,
  });

  String firstName;
  String email;
  String password;
  String confirmPassword;

  factory ProfileRegisterModel.fromJson(Map<String, dynamic> json) =>
      ProfileRegisterModel(
        firstName: json["first_name"] ?? "",
        email: json["email"] ?? "",
        password: json["password"] ?? "",
        confirmPassword: json["confirm_password"] ?? "",
      );
}
