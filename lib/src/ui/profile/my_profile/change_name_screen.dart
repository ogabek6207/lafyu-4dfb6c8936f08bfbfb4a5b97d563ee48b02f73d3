import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyu/src/widget/app_widget.dart';
import 'package:lafyu/src/widget/save_widget.dart';
import '../../../app_theme/app_theme.dart';
import '../../../utils/utils.dart';

class ChangeNameScreen extends StatefulWidget {
  const ChangeNameScreen({Key? key}) : super(key: key);

  @override
  _ChangeNameScreenState createState() => _ChangeNameScreenState();
}

class _ChangeNameScreenState extends State<ChangeNameScreen> {
  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();

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
        title: const AppBarWidget(title: "Name"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(
                top: 16 * h,
              ),
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
                      Row(
                        children: [
                          Text(
                            "First Name",
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
                            top: 12 * h, bottom: 24 * h, right: 16 * w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
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
                          controller: _controllerFirstName,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "First Name",
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
                      Row(
                        children: [
                          Text(
                            "Last Name",
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
                          top: 12 * h,
                          bottom: 24 * h,
                          right: 16 * w,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
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
                          controller: _controllerLastName,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Last Name",
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
          SaveWidget(
            title: "Save",
          ),
        ],
      ),
    );
  }
}
