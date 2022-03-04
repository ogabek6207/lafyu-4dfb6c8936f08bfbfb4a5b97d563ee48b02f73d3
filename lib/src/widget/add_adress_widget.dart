import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_theme/app_theme.dart';
import '../utils/utils.dart';

class AddAddressWidget extends StatefulWidget {
 final TextEditingController controller;
 final String hintText;

   const AddAddressWidget({Key? key, required this.controller, required this.hintText}) : super(key: key);

  @override
  _AddAddressWidgetState createState() => _AddAddressWidgetState();
}

class _AddAddressWidgetState extends State<AddAddressWidget> {
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
      margin: EdgeInsets.only(
        top: 12 * h,
        bottom: 8 * h,
        right: 16 * w,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16 * w,
      ),
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
    );
  }
}
