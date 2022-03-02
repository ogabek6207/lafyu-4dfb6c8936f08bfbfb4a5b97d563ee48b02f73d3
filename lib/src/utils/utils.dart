import 'package:flutter/cupertino.dart';

class Utils {
  static double windowHeight(BuildContext context) {
    return MediaQuery.of(context).size.height / 812;
  }

  static double windowWidth(BuildContext context) {
    return MediaQuery.of(context).size.width / 375;
  }
  static String getMonth(int now) {
    if (now == 1) {
      return "Yanvar";
    } else if (now == 2) {
      return "Fevral";
    } else if (now == 3) {
      return "Mart";
    } else if (now == 4) {
      return "April";
    } else if (now == 5) {
      return "May";
    } else if (now == 6) {
      return "Iyun";
    } else if (now == 7) {
      return "Iyul";
    } else if (now == 8) {
      return "Avgust";
    } else if (now == 9) {
      return "Sentabr";
    } else if (now == 10) {
      return "Octabr";
    } else if (now == 11) {
      return "Noyabr";
    } else {
      return "Dekabr";
    }
  }
}