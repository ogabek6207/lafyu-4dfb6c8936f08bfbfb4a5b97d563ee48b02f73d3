// ignore_for_file: prefer_typing_uninitialized_variables

class HttpResult {
  int statusCode;
  bool isSucces;
  var result;


  HttpResult({
    required this.statusCode,
    required this.isSucces,
    required this.result,
  });
}
