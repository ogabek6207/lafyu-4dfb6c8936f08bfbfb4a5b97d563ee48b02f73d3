import '../app_provider/app_provider.dart';
import '../model/auth/http_result.dart';

class Repository {
  final AppProvider _provider = AppProvider();

  Future<HttpResult> sendLogin(String firstName, password) =>
      _provider.getLogin(firstName, password);

  Future<HttpResult> sendEmail(
    String email,
  ) =>
      _provider.sendEmail(email);

  Future<HttpResult> sendRegister(
          String firstName, password, confirmPassword, email) =>
      _provider.sendRegister(firstName, password, confirmPassword, email);

  Future<HttpResult> getSearch(String number) => _provider.getSearch();

  Future<HttpResult> getSuperFlash() => _provider.getSuperFlash();

  Future<HttpResult> getSuperFlashCategory(int id) =>
      _provider.getSuperFlashCategory(id);

  Future<HttpResult> getProduct(
    String isHome,
    String megaSale,
    String flashSale,
  ) =>
      _provider.getProduct(isHome, megaSale, flashSale);

  Future<HttpResult> getFlashSale() => _provider.getFlashSale();

  Future<HttpResult> getProductDescription(int id) =>
      _provider.getProductDescription(id);

  Future<HttpResult> getCategory() => _provider.getCategory();

  Future<HttpResult> getRecommend() => _provider.getRecommend();

  Future<HttpResult> getHomeSale() => _provider.getHomeSale();
}
