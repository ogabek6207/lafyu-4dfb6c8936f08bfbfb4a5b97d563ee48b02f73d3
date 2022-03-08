import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app_theme/app_theme.dart';
import '../utils/utils.dart';

class AppBarWidget extends StatefulWidget {
  final String title;

  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
            right: 12 * w,
          ),
          height: 24 * o,
          width: 24 * o,
          child: Material(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                "assets/icons/arrow_left.svg",
                height: 24 * o,
                width: 24 * o,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            widget.title,
            style: TextStyle(
              color: AppTheme.dark63,
              fontFamily: AppTheme.fontFamilyPoppins,
              fontSize: 16 * o,
              height: 1.5,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
