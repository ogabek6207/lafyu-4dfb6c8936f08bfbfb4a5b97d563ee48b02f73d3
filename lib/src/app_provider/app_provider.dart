import 'dart:async';
import 'dart:convert';
import 'dart:io';

import "package:http/http.dart" as http;

import '../model/auth/http_result.dart';

class AppProvider {
  String baseUrl = "https://lafyuu.qtlms.uz/api/v1/";
  static Duration duration = const Duration(seconds: 30);

  static Future<HttpResult> _getResponse(String url) async {
    print(url);
    try {
      http.Response response = await http
          .get(
            Uri.parse(url),
          )
          .timeout(duration);
      return _result(response);
    } on TimeoutException catch (_) {
      return HttpResult(
        statusCode: -1,
        isSucces: false,
        result: "Internet error",
      );
    } on SocketException catch (_) {
      return HttpResult(
        statusCode: -1,
        isSucces: false,
        result: "InternetError",
      );
    }
  }

  static Future<HttpResult> _postResponse(String url, data) async {
    print(url);
    print(data);

    try {
      http.Response response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(duration);

      return _result(response);
    } on SocketException catch (_) {
      return HttpResult(
        statusCode: -1,
        isSucces: false,
        result: "Internet Error",
      );
    } on TimeoutException catch (_) {
      return HttpResult(
        statusCode: -1,
        isSucces: false,
        result: "Internet Error",
      );
    }
  }

  static Future<HttpResult> _postResponseRegister(
    String url,
    data,
  ) async {
    print(url);
    print(data);
    try {
      http.Response response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(duration);

      return _result(response);
    } on SocketException catch (_) {
      return HttpResult(
        statusCode: -1,
        isSucces: false,
        result: "Internet Error",
      );
    } on TimeoutException catch (_) {
      return HttpResult(
        statusCode: -1,
        isSucces: false,
        result: "Internet Error",
      );
    }
  }

  static HttpResult _result(http.Response response) {
    print(response.body);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return HttpResult(
        statusCode: response.statusCode,
        isSucces: true,
        result: json.decode(utf8.decode(response.bodyBytes)),
      );
    } else if (response.statusCode >= 500) {
      return HttpResult(
        statusCode: response.statusCode,
        isSucces: false,
        result: "Server error",
      );
    } else {
      return HttpResult(
        statusCode: response.statusCode,
        isSucces: false,
        result: json.decode(
          utf8.decode(
            response.bodyBytes,
          ),
        ),
      );
    }
  }

  Future<HttpResult> getLogin(
    String firstName,
    password,
  ) async {
    String url = baseUrl + "login";
    var data = {
      "first_name": firstName,
      "password": password,
    };
    return _postResponse(url, data);
  }

  Future<HttpResult> sendEmail(
    String email,
  ) async {
    String url = baseUrl + "forget_password";
    var data = {
      "email": email,
    };
    return _postResponse(url, data);
  }

  Future<HttpResult> sendRegister(
    String firstName,
    password,
    confirmPassword,
    email,
  ) async {
    String url = baseUrl + "register";
    var data = {
      "first_name": firstName,
      "password": password,
      "confirm_password": confirmPassword,
      "email": email,
    };
    return _postResponse(url, data);
  }

  Future<HttpResult> registerData(
    String firstName,
    String email,
    String password,
    String confirmPassword,
  ) async {
    String url = baseUrl + "register";

    var data = {
      "first_name": firstName,
      "email": email,
      "password": password,
      "confirm_password": confirmPassword,
    };
    return _postResponseRegister(
      url,
      data,
    );
  }

  Future<HttpResult> acceptData(
    String smsCode,
    String email,
  ) async {
    String url = baseUrl + "accept";

    var data = {
      "sms_code": smsCode,
      "email": email,
    };
    return _postResponseRegister(
      url,
      data,
    );
  }

  Future<HttpResult> getProduct(
    String isHome,
    String megaSale,
    String flashSale,
  ) async {
    String url = baseUrl +
        "product/?flash_sale=$flashSale&mega_sale=$megaSale&home_sale=$isHome";
    return _getResponse(url);
  }

  Future<HttpResult> getFlashSale() async {
    String url = baseUrl + "product/?flash_sale=true";
    return _getResponse(url);
  }

  Future<HttpResult> getCategory() async {
    String url = baseUrl + "category";
    return _getResponse(url);
  }

  Future<HttpResult> getProductDescription(int id) async {
    String url = baseUrl + "product/$id";
    return _getResponse(url);
  }

  Future<HttpResult> getRecommend() async {
    String url = baseUrl + "recomendedproduct";
    return _getResponse(url);
  }

  Future<HttpResult> getHomeSale() async {
    String url = baseUrl + "product/?home_sale=true";
    return _getResponse(url);
  }

  Future<HttpResult> getSearch() async {
    String url = baseUrl + "drugs?search=";
    return _getResponse(url);
  }

  Future<HttpResult> getSuperFlash() async {
    String url = baseUrl + "superflash";
    return _getResponse(url);
  }

  Future<HttpResult> getSuperFlashCategory(int id) async {
    String url = baseUrl + "superflash/$id";
    return _getResponse(url);
  }
}
