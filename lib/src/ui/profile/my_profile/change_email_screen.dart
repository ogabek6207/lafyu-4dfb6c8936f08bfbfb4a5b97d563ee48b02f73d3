import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyu/src/widget/app_widget.dart';
import 'package:lafyu/src/widget/save_widget.dart';
import 'package:lafyu/src/widget/title_widget.dart';

import '../../../app_theme/app_theme.dart';
import '../../../utils/utils.dart';

class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen({Key? key}) : super(key: key);

  @override
  _ChangeEmailScreenState createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  final TextEditingController _controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        backgroundColor: AppTheme.white,
        title: const AppBarWidget(title: "Email"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 16 * w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                   const TitleWidget(title: "Change Email"),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5 * o),
                        ),
                        margin: EdgeInsets.only(
                            top: 12 * h, bottom: 8 * h, right: 16 * w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: SvgPicture.asset(
                                "assets/icons/email.svg",
                              ),
                              margin: EdgeInsets.only(
                                right: 10 * w,
                              ),
                            ),
                            Expanded(
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
                                controller: _controllerEmail,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Your Email",
                                  hintStyle: TextStyle(
                                    color: AppTheme.greyB1,
                                    fontSize: 12 * o,
                                    fontFamily: AppTheme.fontFamilyPoppins,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "We Will Send verification to your New Email",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppTheme.blueFF,
                          fontFamily: AppTheme.fontFamilyPoppins,
                          fontSize: 12 * o,
                          height: 1.8,
                          letterSpacing: 0.5,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SaveWidget(
            title: "Change Email",
          ),
        ],
      ),
    );
  }
}
