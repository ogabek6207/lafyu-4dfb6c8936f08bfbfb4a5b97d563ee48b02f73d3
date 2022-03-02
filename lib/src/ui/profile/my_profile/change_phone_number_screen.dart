import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyu/src/widget/app_widget.dart';
import 'package:lafyu/src/widget/save_widget.dart';

import '../../../app_theme/app_theme.dart';
import '../../../utils/utils.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  TextEditingController _controllerPhoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(title: "Phone Number"),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                top: 16 * h,
              ),
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 16 * w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Phone Number",
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
                        ],
                      ),
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
                                "assets/icons/phone.svg",
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
                                controller: _controllerPhoneNumber,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Phone Number",
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
