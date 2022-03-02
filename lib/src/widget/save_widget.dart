import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';

import '../utils/utils.dart';

class SaveWidget extends StatefulWidget {
  String title;

  SaveWidget({required this.title});

  @override
  _SaveWidgetState createState() => _SaveWidgetState();
}

class _SaveWidgetState extends State<SaveWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Container(
      margin: EdgeInsets.only(bottom: (Platform.isIOS ? 52 : 40) * h),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                height: 57 * h,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  left: 16 * w,
                  right: 16 * w,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.blueFF,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30*o,
                      spreadRadius: 0,
                      color: AppTheme.blueFF.withOpacity(0.24),
                      offset: Offset(
                        0,
                        10*w,
                      ),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5 * o),
                ),
                child: Center(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: AppTheme.white,
                      fontFamily: AppTheme.fontFamilyPoppins,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 14 * o,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
