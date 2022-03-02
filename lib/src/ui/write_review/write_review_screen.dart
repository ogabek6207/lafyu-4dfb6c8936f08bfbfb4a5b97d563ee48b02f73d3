import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';

import '../../utils/utils.dart';
import '../../widget/button_widget.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({Key? key}) : super(key: key);

  @override
  _WriteReviewScreenState createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppTheme.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: SvgPicture.asset('assets/icons/left.svg'),
          ),
        ),
        title: Text(
          'Sharh yozish',
          style: TextStyle(fontSize: 16 * h, color: AppTheme.dark63),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 16 * h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 16 * w),
                  child: Text(
                    'Yuk tashish / yetkazib berish xizmatidan umumiy qoniqish darajasini yozing',
                    style: TextStyle(
                        fontSize: 14 * h,
                        color: AppTheme.dark63,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 16 * w,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 16 * w,
                    ),
                    SvgPicture.asset(
                      'assets/icons/star.svg',
                      width: 32 * w,
                    ),
                    SizedBox(
                      width: 16 * w,
                    ),
                    SvgPicture.asset(
                      'assets/icons/star.svg',
                      width: 32 * w,
                    ),
                    SizedBox(
                      width: 16 * w,
                    ),
                    SvgPicture.asset(
                      'assets/icons/star.svg',
                      width: 32 * w,
                    ),
                    SizedBox(
                      width: 16 * w,
                    ),
                    SvgPicture.asset(
                      'assets/icons/star.svg',
                      width: 32 * w,
                    ),
                    SizedBox(
                      width: 16 * w,
                    ),
                    SvgPicture.asset(
                      'assets/icons/star.svg',
                      width: 32 * w,
                    ),
                    SizedBox(
                      width: 16 * w,
                    ),
                    Text(
                      '4 /',
                      style: TextStyle(
                          fontSize: 14 * h,
                          color: AppTheme.greyB1,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '5',
                      style: TextStyle(
                          fontSize: 14 * h,
                          color: AppTheme.greyB1,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24 * h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 16 * w),
                  child: Text(
                    'Sharhingizni yozing',
                    style: TextStyle(
                        fontSize: 14 * h, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 12*h,),
                Container(
                  padding: EdgeInsets.only(left: 16*w,),
                  margin: EdgeInsets.symmetric(horizontal: 16*w),
                  width: MediaQuery.of(context).size.width,
                  height: 160*h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppTheme.greyB1.withOpacity(0.3))
                  ),
                  child: TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Sharhingizni shu yerda yozing'
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16*w,top: 24*h),
                  child: Text('Rasim qo\'shish',style: TextStyle(fontSize: 14*h,fontWeight: FontWeight.w700),),
                )
              ],
            ),
          ),
          ButtonWidget(
            margin: EdgeInsets.only(
                left: 16 * w,
                right: 16 * w,
                bottom: Platform.isIOS ? 32 : 24),
            width: MediaQuery.of(context).size.width,
            text: 'Yuborish',
            color: AppTheme.blueFF,
            height: 57 * h,
            onTap: () {},
          ),

        ],
      ),
    );
  }
}
