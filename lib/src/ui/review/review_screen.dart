import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';

import '../../utils/utils.dart';
import '../../widget/button_widget.dart';
import '../write_review/write_review_screen.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    double w = Utils.windowWidth(context);
    double h = Utils.windowHeight(context);
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Center(
          child: SvgPicture.asset('assets/icons/left.svg'),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 16 * w,
                    ),
                    SizedBox(
                      width: 48 * h,
                      height: 48 * h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          'https://img.etimg.com/thumb/width-640,height-480,imgsize-144736,resizemode-1,msid-69037337/small-biz/startups/newsbuzz/fraud-is-only-possible-if-user-grants-access-oldrich-mller-coo-anydesk/oldrich-muller.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16 * w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'James Lawson',
                            style: TextStyle(
                              fontSize: 14 * h,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 4 * h,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/star.svg'),
                              SvgPicture.asset('assets/icons/star.svg'),
                              SvgPicture.asset('assets/icons/star.svg'),
                              SvgPicture.asset('assets/icons/star.svg'),
                              SvgPicture.asset('assets/icons/star.svg'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16 * h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16 * w),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'air max har doim juda qulay, toza va har tomonlama mukammaldir. faqat quti juda kichkina edi va krossovkalarni biroz qisib qo\'ydi, quti har doim shunday kichkina bo\'lganiga ishonchim komil emas, lekin 90-yillar mening sevimlilarimdan biri bo\'lgan va shunday bo\'lib qoladi.',
                        style: TextStyle(
                            fontSize: 12 * h,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.greyB1),
                      ),
                      SizedBox(
                        height: 23 * h,
                      ),
                      Text(
                        'December 10, 2016',
                        style: TextStyle(
                          fontSize: 10 * h,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16 * h,
                ),
              ],
            );
          })),
          ButtonWidget(
            margin: EdgeInsets.only(
                left: 16 * w, right: 16 * w, bottom: Platform.isIOS ? 32 : 24),
            width: MediaQuery.of(context).size.width,
            text: 'Sharh yozish',
            color: AppTheme.blueFF,
            height: 57 * h,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const WriteReviewScreen();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
