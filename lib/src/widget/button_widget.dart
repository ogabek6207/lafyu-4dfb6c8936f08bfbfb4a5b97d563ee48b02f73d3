import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';

import '../utils/utils.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.height,
    required this.width,
    this.margin = const EdgeInsets.all(0),
    required this.color,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final double height;
  final double width;
  final Color color;
  final EdgeInsets margin;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    double w = Utils.windowWidth(context);
    double h = Utils.windowHeight(context);
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(64, 191, 255, 0.24),
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(0.1, 0.3)
            )
          ],
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: AppTheme.white,
                fontFamily: AppTheme.fontFamilyPoppins,
                fontWeight: FontWeight.w700,
                fontSize: 14 * h),
          ),
        ),
      ),
    );
  }
}
