import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/ui/profile/my_profile/my_profile_screen.dart';
import 'package:lafyu/src/ui/profile/order/order_screen.dart';

import '../../utils/utils.dart';
import 'address/address_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 70 * h,
              left: 16 * w,
              bottom: 28 * h,
            ),
            child: Text(
              "Account",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppTheme.dark63,
                fontWeight: FontWeight.bold,
                fontSize: 16 * o,
                fontStyle: FontStyle.normal,
                fontFamily: AppTheme.fontFamilyPoppins,
                letterSpacing: 0.005,
                height: 1.5,
              ),
            ),
          ),
          Container(
            height: 1 * h,
            width: MediaQuery.of(context).size.width,
            color: AppTheme.border,
          ),
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
                          builder: (context) => const MyProfileScreen()),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: 56 * h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/user_blue.svg",
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 16 * w,
                          ),
                          child: Text(
                            "Profile",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppTheme.dark63,
                              fontWeight: FontWeight.bold,
                              fontSize: 12 * o,
                              fontStyle: FontStyle.normal,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              letterSpacing: 0.5,
                              height: 1.5,
                            ),
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
                        builder: (context) => const OrderScreen(),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: 56 * h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/bag.svg",
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 16 * w,
                          ),
                          child: Text(
                            "Order",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppTheme.dark63,
                              fontWeight: FontWeight.bold,
                              fontSize: 12 * o,
                              fontStyle: FontStyle.normal,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              letterSpacing: 0.5,
                              height: 1.5,
                            ),
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
                        builder: (context) => const AddressScreen(),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: 56 * h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/location.svg",
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 16 * w,
                          ),
                          child: Text(
                            "Address",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppTheme.dark63,
                              fontWeight: FontWeight.bold,
                              fontSize: 12 * o,
                              fontStyle: FontStyle.normal,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              letterSpacing: 0.5,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 56 * h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/payment.svg",
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 16 * w,
                        ),
                        child: Text(
                          "Payment",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppTheme.dark63,
                            fontWeight: FontWeight.bold,
                            fontSize: 12 * o,
                            fontStyle: FontStyle.normal,
                            fontFamily: AppTheme.fontFamilyPoppins,
                            letterSpacing: 0.5,
                            height: 1.5,
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
    );
  }
}
