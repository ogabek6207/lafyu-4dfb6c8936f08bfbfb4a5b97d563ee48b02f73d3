import 'package:flutter/material.dart';
import 'package:lafyu/src/ui/profile/my_profile/change_email_screen.dart';
import 'package:lafyu/src/ui/profile/my_profile/change_password_screen.dart';
import 'package:lafyu/src/ui/profile/my_profile/change_phone_number_screen.dart';
import 'package:lafyu/src/ui/profile/my_profile/edit_birthday_screen.dart';
import 'package:lafyu/src/ui/profile/my_profile/edit_gender_screen.dart';
import 'package:lafyu/src/ui/profile/my_profile/change_name_screen.dart';
import 'package:lafyu/src/widget/app_widget.dart';
import 'package:lafyu/src/widget/profile_widget.dart';

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
                  child: const ProfileWidget(
                    title: "Male",
                    name: "Gender",
                    icon: "assets/icons/gender.svg",
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
                  child: const ProfileWidget(
                    title: "12-12-2000",
                    icon: "assets/icons/calendar.svg",
                    name: "Birthday",
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
                  child: const ProfileWidget(
                    title: 'Derlaxy@yahoo.com',
                    name: 'Email',
                    icon: 'assets/icons/message.svg',
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
                  child: const ProfileWidget(
                    title: '(307) 555-0133',
                    name: 'Phone Number',
                    icon: 'assets/icons/phone.svg',
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
                  child: const ProfileWidget(
                    icon: 'assets/icons/password_blue.svg',
                    name: 'Change Password',
                    title: '•••••••••••••••••',
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
