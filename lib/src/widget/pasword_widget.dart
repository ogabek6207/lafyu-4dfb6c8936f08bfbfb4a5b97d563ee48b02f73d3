import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_theme/app_theme.dart';
import '../utils/utils.dart';

class PasswordWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const PasswordWidget({Key? key, required this.hintText, required this.controller})
      : super(key: key);

  @override
  _PasswordWidgetState createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppTheme.border,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5 * o),
      ),
      margin: EdgeInsets.only(top: 12 * h, bottom: 8 * h, right: 16 * w),
      padding: EdgeInsets.symmetric(
        horizontal: 16 * w,
      ),
      child: Row(
        children: [
          Container(
            child: SvgPicture.asset(
              "assets/icons/password.svg",
            ),
            margin: EdgeInsets.only(
              right: 10 * w,
            ),
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: AppTheme.greyB1,
                fontSize: 12 * o,
                height: 1.8,
                letterSpacing: 0.5,
                fontFamily: AppTheme.fontFamilyPoppins,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
              controller: widget.controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: AppTheme.greyB1,
                  fontSize: 12 * o,
                  fontFamily: AppTheme.fontFamilyPoppins,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
