import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_theme/app_theme.dart';
import '../utils/utils.dart';

class AccountWidget extends StatefulWidget {
  final String icon;
  final String title;

  const AccountWidget({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  _AccountWidgetState createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Container(
      color: Colors.transparent,
      height: 56 * h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            widget.icon,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 16 * w,
            ),
            child: Text(
              widget.title,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppTheme.dark63,
                fontWeight: FontWeight.bold,
                fontSize: 12 * o,
                fontStyle: FontStyle.normal,
                fontFamily: AppTheme.fontFamilyPoppins,
                letterSpacing: 0.5,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
