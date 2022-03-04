import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_theme/app_theme.dart';
import '../utils/utils.dart';

class ProfileWidget extends StatefulWidget {
  final String icon;
  final String name;
  final String title;

  const ProfileWidget(
      {Key? key, required this.icon, required this.name, required this.title})
      : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Container(
      color: Colors.transparent,
      height: 54 * h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            widget.icon,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                left: 16 * w,
              ),
              child: Text(
                widget.name,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: AppTheme.dark63,
                  fontWeight: FontWeight.bold,
                  fontSize: 12 * o,
                  fontStyle: FontStyle.normal,
                  fontFamily: AppTheme.fontFamilyPoppins,
                  letterSpacing: 0.5,
                  height: 1.5 * h,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: 16 * w,
            ),
            child: Text(
              widget.title,
              style: TextStyle(
                color: AppTheme.greyB1,
                fontWeight: FontWeight.normal,
                fontSize: 12 * o,
                fontStyle: FontStyle.normal,
                fontFamily: AppTheme.fontFamilyPoppins,
                letterSpacing: 0.5,
                height: 1.8 * h,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: 16 * w,
            ),
            child: SvgPicture.asset(
              "assets/icons/arrow_right.svg",
            ),
          ),
        ],
      ),
    );
  }
}
