import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/widget/app_widget.dart';

import '../../utils/utils.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppTheme.white,
        title: AppBarWidget(
          title: "Notification",
        ),
      ),
      backgroundColor: AppTheme.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 16 * w,
              top: 16 * h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/location.svg",
                    ),
                    SizedBox(
                      width: 16 * w,
                    ),
                    Expanded(
                      child: Text(
                        "Offer",
                        style: TextStyle(
                          letterSpacing: 0.5,
                          color: AppTheme.dark63,
                          fontFamily: AppTheme.fontFamilyPoppins,
                          fontWeight: FontWeight.bold,
                          fontSize: 12 * o,
                          fontStyle: FontStyle.normal,
                          height: 1.5 * h,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * o),
                        border: Border.all(
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
