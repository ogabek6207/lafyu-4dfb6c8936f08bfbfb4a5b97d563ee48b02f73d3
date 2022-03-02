import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_theme/app_theme.dart';
import '../../utils/utils.dart';

class CenterDialog {
  static void showErrorDialog(
      BuildContext context,
      String msg,
      ) {
    showDialog(
        context: context,
        builder: (context) {
          double h = Utils.windowHeight(context);
          double w = Utils.windowWidth(context);
          double o = (h + w) / 2;
          return CupertinoAlertDialog(
            title: const Text("Error"),
            content: Text(msg),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 44*h,
                  color: Colors.transparent,
                  child:  Center(
                    child: Text("ok",
                    style: TextStyle(
                      color: AppTheme.red,
                      fontSize: 24*o,
                    ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}