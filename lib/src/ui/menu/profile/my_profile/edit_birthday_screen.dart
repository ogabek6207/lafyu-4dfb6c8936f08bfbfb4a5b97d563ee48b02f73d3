import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/widget/app_widget.dart';
import 'package:lafyu/src/widget/save_widget.dart';
import 'package:lafyu/src/widget/title_widget.dart';

import 'package:lafyu/src/utils/utils.dart';

class EditBirthdayScreen extends StatefulWidget {
  const EditBirthdayScreen({Key? key}) : super(key: key);

  @override
  _EditBirthdayScreenState createState() => _EditBirthdayScreenState();
}

class _EditBirthdayScreenState extends State<EditBirthdayScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.white,
        elevation: 1,
        title: const AppBarWidget(title: "Birthday"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 16 * w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const TitleWidget(
                        title: 'Your Birthday',
                      ),
                      Container(
                        height: 48 * h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5 * o),
                        ),
                        margin: EdgeInsets.only(
                            top: 12 * h, bottom: 24 * h, right: 16 * w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Text(
                                "12/12/2012",
                                style: TextStyle(
                                  color: AppTheme.greyB1,
                                  fontSize: 12 * o,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: AppTheme.fontFamilyPoppins,
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                              "assets/icons/calendar1.svg",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SaveWidget(
            title: "Save",
          ),
        ],
      ),
    );
  }
}
