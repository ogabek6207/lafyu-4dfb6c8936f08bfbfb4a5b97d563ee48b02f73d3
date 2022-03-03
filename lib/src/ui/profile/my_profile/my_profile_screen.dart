import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyu/src/ui/profile/my_profile/change_email_screen.dart';
import 'package:lafyu/src/ui/profile/my_profile/change_password_screen.dart';
import 'package:lafyu/src/ui/profile/my_profile/change_phone_number_screen.dart';
import 'package:lafyu/src/ui/profile/my_profile/edit_birthday_screen.dart';
import 'package:lafyu/src/ui/profile/my_profile/edit_gender_screen.dart';
import 'package:lafyu/src/ui/profile/my_profile/change_name_screen.dart';
import 'package:lafyu/src/widget/app_widget.dart';

import '../../../app_theme/app_theme.dart';
import '../../../utils/utils.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        title: const AppBarWidget(title: "Profile"),
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 1,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 16 * w,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangeNameScreen(),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    margin: EdgeInsets.only(top: 24 * h, bottom: 32 * h),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            right: 16 * w,
                          ),
                          height: 72 * o,
                          width: 72 * o,
                          child: ClipRRect(
                            child: Image.asset("assets/images/user.png"),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(),
                              child: Text(
                                "Maximus Gold",
                                style: TextStyle(
                                  color: AppTheme.dark63,
                                  fontFamily: AppTheme.fontFamilyPoppins,
                                  fontSize: 14 * o,
                                  height: 1.5 * h,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              "@derlaxy",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppTheme.greyB1,
                                fontFamily: AppTheme.fontFamilyPoppins,
                                fontSize: 12 * o,
                                height: 1.8 * h,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditGenderScreen(),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: 54 * h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/gender.svg",
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 16 * w,
                            ),
                            child: Text(
                              "Gender",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppTheme.dark63,
                                fontWeight: FontWeight.bold,
                                fontSize: 12 * o,
                                fontStyle: FontStyle.normal,
                                fontFamily: AppTheme.fontFamilyPoppins,
                                letterSpacing: 0.5,
                                height: 1.5 * h,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 16 * w,
                          ),
                          child: Text(
                            "Male",
                            style: TextStyle(
                              color: AppTheme.greyB1,
                              fontWeight: FontWeight.normal,
                              fontSize: 12 * o,
                              fontStyle: FontStyle.normal,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              letterSpacing: 0.5,
                              height: 1.8 * h,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 16 * w,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/arrow_right.svg",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditBirthdayScreen(),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: 54 * h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/calendar.svg",
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 16 * w,
                            ),
                            child: Text(
                              "Birthday",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppTheme.dark63,
                                fontWeight: FontWeight.bold,
                                fontSize: 12 * o,
                                fontStyle: FontStyle.normal,
                                fontFamily: AppTheme.fontFamilyPoppins,
                                letterSpacing: 0.5,
                                height: 1.5 * h,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 16 * w,
                          ),
                          child: Text(
                            "12-12-2000",
                            style: TextStyle(
                              color: AppTheme.greyB1,
                              fontWeight: FontWeight.normal,
                              fontSize: 12 * o,
                              fontStyle: FontStyle.normal,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              letterSpacing: 0.5,
                              height: 1.8 * h,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 16 * w,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/arrow_right.svg",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangeEmailScreen(),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: 54 * h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/message.svg",
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 16 * w,
                            ),
                            child: Text(
                              "Email",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppTheme.dark63,
                                fontWeight: FontWeight.bold,
                                fontSize: 12 * o,
                                fontStyle: FontStyle.normal,
                                fontFamily: AppTheme.fontFamilyPoppins,
                                letterSpacing: 0.5,
                                height: 1.5 * h,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 16 * w,
                          ),
                          child: Text(
                            "Derlaxy@yahoo.com",
                            style: TextStyle(
                              color: AppTheme.greyB1,
                              fontWeight: FontWeight.normal,
                              fontSize: 12 * o,
                              fontStyle: FontStyle.normal,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              letterSpacing: 0.5,
                              height: 1.8 * h,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 16 * w,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/arrow_right.svg",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhoneNumberScreen(),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: 54 * h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/phone.svg",
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 16 * w,
                            ),
                            child: Text(
                              "Phone Number",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppTheme.dark63,
                                fontWeight: FontWeight.bold,
                                fontSize: 12 * o,
                                fontStyle: FontStyle.normal,
                                fontFamily: AppTheme.fontFamilyPoppins,
                                letterSpacing: 0.5,
                                height: 1.5 * h,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 16 * w,
                          ),
                          child: Text(
                            "(307) 555-0133",
                            style: TextStyle(
                              color: AppTheme.greyB1,
                              fontWeight: FontWeight.normal,
                              fontSize: 12 * o,
                              fontStyle: FontStyle.normal,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              letterSpacing: 0.5,
                              height: 1.8 * h,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 16 * w,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/arrow_right.svg",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePasswordScreen(),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: 54 * h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/password_blue.svg",
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 16 * w,
                            ),
                            child: Text(
                              "Change Password",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppTheme.dark63,
                                fontWeight: FontWeight.bold,
                                fontSize: 12 * o,
                                fontStyle: FontStyle.normal,
                                fontFamily: AppTheme.fontFamilyPoppins,
                                letterSpacing: 0.5,
                                height: 1.5 * h,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 16 * w,
                          ),
                          child: Text(
                            "•••••••••••••••••",
                            style: TextStyle(
                              color: AppTheme.greyB1,
                              fontWeight: FontWeight.normal,
                              fontSize: 12 * o,
                              fontStyle: FontStyle.normal,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              letterSpacing: 0.5,
                              height: 1.8 * h,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 16 * w,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/arrow_right.svg",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
