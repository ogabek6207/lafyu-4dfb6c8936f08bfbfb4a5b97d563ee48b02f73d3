import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyu/src/widget/app_widget.dart';

import '../../app_theme/app_theme.dart';
import '../../utils/utils.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Column(
        children: [
     const AppBarWidget(title: "Favorite Product"),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: 165 * w,
                        margin: EdgeInsets.only(
                          left: 16 * w,
                          top: 16 * h,
                        ),
                        height: 282,
                        padding: EdgeInsets.all(
                          16 * o,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5 * o),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 133 * o,
                              width: 133 * o,
                              margin: EdgeInsets.only(
                                bottom: 8 * h,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.white,
                                borderRadius: BorderRadius.circular(5 * o),
                                border: Border.all(
                                  color: AppTheme.border,
                                  width: 1,
                                ),
                              ),
                              child: ClipRect(
                                child: Image.asset(
                                  "assets/images/product1.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 133 * w,
                              child: Text(
                                "Nike Air Max 270 React ENG",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12 * o,
                                  color: AppTheme.dark63,
                                  fontFamily: AppTheme.fontFamilyPoppins,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4 * h),
                              width: 68,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star1.svg",
                                    color: AppTheme.border,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              "\$299,43",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12 * o,
                                                color: AppTheme.blueFF,
                                                fontFamily:
                                                    AppTheme.fontFamilyPoppins,
                                              ),
                                            ),
                                            margin: EdgeInsets.only(
                                              bottom: 4 * h,
                                              top: 16 * h,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "534,33",
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 10 * o,
                                              color: AppTheme.greyB1,
                                              fontFamily:
                                                  AppTheme.fontFamilyPoppins,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8 * w,
                                          ),
                                          Text(
                                            "24% Off",
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 10 * o,
                                              color: AppTheme.red,
                                              fontFamily:
                                                  AppTheme.fontFamilyPoppins,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset("assets/icons/korzinka.svg")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 165 * w,
                        margin: EdgeInsets.only(
                          left: 16 * w,
                          top: 16 * h,
                        ),
                        height: 282,
                        padding: EdgeInsets.all(
                          16 * o,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5 * o),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 133 * o,
                              width: 133 * o,
                              margin: EdgeInsets.only(
                                bottom: 8 * h,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.white,
                                borderRadius: BorderRadius.circular(5 * o),
                                border: Border.all(
                                  color: AppTheme.border,
                                  width: 1,
                                ),
                              ),
                              child: ClipRect(
                                child: Image.asset(
                                  "assets/images/product1.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 133 * w,
                              child: Text(
                                "Nike Air Max 270 React ENG",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12 * o,
                                  color: AppTheme.dark63,
                                  fontFamily: AppTheme.fontFamilyPoppins,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4 * h),
                              width: 68,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star1.svg",
                                    color: AppTheme.border,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              "\$299,43",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12 * o,
                                                color: AppTheme.blueFF,
                                                fontFamily:
                                                    AppTheme.fontFamilyPoppins,
                                              ),
                                            ),
                                            margin: EdgeInsets.only(
                                              bottom: 4 * h,
                                              top: 16 * h,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "534,33",
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 10 * o,
                                              color: AppTheme.greyB1,
                                              fontFamily:
                                                  AppTheme.fontFamilyPoppins,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8 * w,
                                          ),
                                          Text(
                                            "24% Off",
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 10 * o,
                                              color: AppTheme.red,
                                              fontFamily:
                                                  AppTheme.fontFamilyPoppins,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset("assets/icons/korzinka.svg")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: 165 * w,
                        margin: EdgeInsets.only(
                          left: 16 * w,
                          top: 16 * h,
                        ),
                        height: 282,
                        padding: EdgeInsets.all(
                          16 * o,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5 * o),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 133 * o,
                              width: 133 * o,
                              margin: EdgeInsets.only(
                                bottom: 8 * h,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.white,
                                borderRadius: BorderRadius.circular(5 * o),
                                border: Border.all(
                                  color: AppTheme.border,
                                  width: 1,
                                ),
                              ),
                              child: ClipRect(
                                child: Image.asset(
                                  "assets/images/product1.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 133 * w,
                              child: Text(
                                "Nike Air Max 270 React ENG",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12 * o,
                                  color: AppTheme.dark63,
                                  fontFamily: AppTheme.fontFamilyPoppins,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4 * h),
                              width: 68,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star1.svg",
                                    color: AppTheme.border,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              "\$299,43",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12 * o,
                                                color: AppTheme.blueFF,
                                                fontFamily:
                                                    AppTheme.fontFamilyPoppins,
                                              ),
                                            ),
                                            margin: EdgeInsets.only(
                                              bottom: 4 * h,
                                              top: 16 * h,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "534,33",
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 10 * o,
                                              color: AppTheme.greyB1,
                                              fontFamily:
                                                  AppTheme.fontFamilyPoppins,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8 * w,
                                          ),
                                          Text(
                                            "24% Off",
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 10 * o,
                                              color: AppTheme.red,
                                              fontFamily:
                                                  AppTheme.fontFamilyPoppins,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset("assets/icons/korzinka.svg")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 165 * w,
                        margin: EdgeInsets.only(
                          left: 16 * w,
                          top: 16 * h,
                        ),
                        height: 282,
                        padding: EdgeInsets.all(
                          16 * o,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5 * o),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 133 * o,
                              width: 133 * o,
                              margin: EdgeInsets.only(
                                bottom: 8 * h,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.white,
                                borderRadius: BorderRadius.circular(5 * o),
                                border: Border.all(
                                  color: AppTheme.border,
                                  width: 1,
                                ),
                              ),
                              child: ClipRect(
                                child: Image.asset(
                                  "assets/images/product1.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 133 * w,
                              child: Text(
                                "Nike Air Max 270 React ENG",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12 * o,
                                  color: AppTheme.dark63,
                                  fontFamily: AppTheme.fontFamilyPoppins,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4 * h),
                              width: 68,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star1.svg",
                                    color: AppTheme.border,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              "\$299,43",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12 * o,
                                                color: AppTheme.blueFF,
                                                fontFamily:
                                                    AppTheme.fontFamilyPoppins,
                                              ),
                                            ),
                                            margin: EdgeInsets.only(
                                              bottom: 4 * h,
                                              top: 16 * h,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "534,33",
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 10 * o,
                                              color: AppTheme.greyB1,
                                              fontFamily:
                                                  AppTheme.fontFamilyPoppins,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8 * w,
                                          ),
                                          Text(
                                            "24% Off",
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 10 * o,
                                              color: AppTheme.red,
                                              fontFamily:
                                                  AppTheme.fontFamilyPoppins,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset("assets/icons/korzinka.svg")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: 165 * w,
                        margin: EdgeInsets.only(
                          left: 16 * w,
                          top: 16 * h,
                        ),
                        height: 282,
                        padding: EdgeInsets.all(
                          16 * o,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5 * o),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 133 * o,
                              width: 133 * o,
                              margin: EdgeInsets.only(
                                bottom: 8 * h,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.white,
                                borderRadius: BorderRadius.circular(5 * o),
                                border: Border.all(
                                  color: AppTheme.border,
                                  width: 1,
                                ),
                              ),
                              child: ClipRect(
                                child: Image.asset(
                                  "assets/images/product1.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 133 * w,
                              child: Text(
                                "Nike Air Max 270 React ENG",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12 * o,
                                  color: AppTheme.dark63,
                                  fontFamily: AppTheme.fontFamilyPoppins,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4 * h),
                              width: 68,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star1.svg",
                                    color: AppTheme.border,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              "\$299,43",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12 * o,
                                                color: AppTheme.blueFF,
                                                fontFamily:
                                                    AppTheme.fontFamilyPoppins,
                                              ),
                                            ),
                                            margin: EdgeInsets.only(
                                              bottom: 4 * h,
                                              top: 16 * h,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "534,33",
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 10 * o,
                                              color: AppTheme.greyB1,
                                              fontFamily:
                                                  AppTheme.fontFamilyPoppins,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8 * w,
                                          ),
                                          Text(
                                            "24% Off",
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 10 * o,
                                              color: AppTheme.red,
                                              fontFamily:
                                                  AppTheme.fontFamilyPoppins,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset("assets/icons/korzinka.svg")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 165 * w,
                        margin: EdgeInsets.only(
                          left: 16 * w,
                          top: 16 * h,
                        ),
                        height: 282,
                        padding: EdgeInsets.all(
                          16 * o,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5 * o),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 133 * o,
                              width: 133 * o,
                              margin: EdgeInsets.only(
                                bottom: 8 * h,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.white,
                                borderRadius: BorderRadius.circular(5 * o),
                                border: Border.all(
                                  color: AppTheme.border,
                                  width: 1,
                                ),
                              ),
                              child: ClipRect(
                                child: Image.asset(
                                  "assets/images/product1.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 133 * w,
                              child: Text(
                                "Nike Air Max 270 React ENG",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12 * o,
                                  color: AppTheme.dark63,
                                  fontFamily: AppTheme.fontFamilyPoppins,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4 * h),
                              width: 68,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star.svg",
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/star1.svg",
                                    color: AppTheme.border,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              "\$299,43",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12 * o,
                                                color: AppTheme.blueFF,
                                                fontFamily:
                                                    AppTheme.fontFamilyPoppins,
                                              ),
                                            ),
                                            margin: EdgeInsets.only(
                                              bottom: 4 * h,
                                              top: 16 * h,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "534,33",
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 10 * o,
                                              color: AppTheme.greyB1,
                                              fontFamily:
                                                  AppTheme.fontFamilyPoppins,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8 * w,
                                          ),
                                          Text(
                                            "24% Off",
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 10 * o,
                                              color: AppTheme.red,
                                              fontFamily:
                                                  AppTheme.fontFamilyPoppins,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset("assets/icons/korzinka.svg")
                              ],
                            ),
                          ],
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
