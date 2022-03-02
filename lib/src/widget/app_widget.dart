import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../app_theme/app_theme.dart';
import '../utils/utils.dart';

class AppBarWidget extends StatefulWidget {
String title;

AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(


            right: 16 * w,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(
                    right: 12 * w,
                  ),
                  height: 24 * o,
                  width: 24 * o,
                  child: SvgPicture.asset(
                    "assets/icons/arrow_left.svg",
                    height: 24 * o,
                    width: 24 * o,
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
          ),
        ),
        Container(
          height: 1 * h,
          margin: EdgeInsets.only(top: 28 * h),
        ),
      ],
    );
  }
}
