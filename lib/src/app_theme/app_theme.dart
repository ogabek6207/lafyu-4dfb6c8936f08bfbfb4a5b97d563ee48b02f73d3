import 'dart:ui';

class AppTheme {
  ///colors
  static Color white = const Color(0xFFFFFFFF);
  static Color dark63 = const Color(0xFF223263);
  static Color greyB1 = const Color(0xFF9098B1);
  static Color border = const Color(0xFFEBF0FF);
  static Color blueFF = const Color(0xFF40BFFF);
  static Color red = const Color(0xFFFB7181);
  static const Color  purple = Color(0xFF5C61F4);

  ///fonts
  static const String fontFamilyPoppins = "Poppins";
}
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;

    }
    return int.parse(hexColor, radix: 16);


  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}