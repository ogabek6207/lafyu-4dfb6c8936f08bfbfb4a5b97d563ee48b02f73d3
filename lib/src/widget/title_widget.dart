import 'package:flutter/cupertino.dart';

import '../app_theme/app_theme.dart';
import '../utils/utils.dart';

class TitleWidget extends StatefulWidget {
 final String title;

  const TitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  _TitleWidgetState createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Container(
      margin: EdgeInsets.only(top: 16 * h),
      child: Text(
        widget.title,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: AppTheme.dark63,
          fontFamily: AppTheme.fontFamilyPoppins,
          fontSize: 14 * o,
          height: 1.5,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
