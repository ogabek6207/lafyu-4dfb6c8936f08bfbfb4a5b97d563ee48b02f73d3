import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';

import '../../utils/utils.dart';
import '../../widget/button_widget.dart';
import '../../widget/product_widget.dart';
import '../../widget/section_bar_widget.dart';
import '../review/review_screen.dart';

class DetailScreen extends StatefulWidget {
  int id;

  DetailScreen({required this.id});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<int> imgList = [1, 2, 3, 1, 31, 2];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    double w = Utils.windowWidth(context);
    double h = Utils.windowHeight(context);
    return Scaffold(
        backgroundColor: AppTheme.white,
        appBar: AppBar(
          backgroundColor: AppTheme.white,
          automaticallyImplyLeading: true,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: SvgPicture.asset('assets/icons/left.svg'),
            ),
          ),
          title: Text(
            'Nike Air Max 270 Rea...',
            style: TextStyle(fontSize: 16 * h, color: Colors.black),
          ),
          actions: [
            SvgPicture.asset('assets/icons/explore.svg'),
            SizedBox(
              width: 25 * w,
            ),
            SvgPicture.asset('assets/icons/more.svg'),
            SizedBox(
              width: 27 * w,
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  CarouselSlider(
                    items: imgList.map((i) {
                      return Builder(builder: (BuildContext context) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 238 * h,
                          child: Image.network(
                            'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/8c878489-1eff-48b6-b32c-1d313c8bcd8c/free-run-2-big-kids-shoes-bh7MWk.png',
                            fit: BoxFit.cover,
                          ),
                        );
                      });
                    }).toList(),
                    options: CarouselOptions(
                      height: 238 * h,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 10.0,
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppTheme.greyB1
                                      : AppTheme.blueFF)
                                  .withOpacity(
                                      _current == entry.key ? 1 : 0.3)),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 8 * h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 275 * w,
                        child: Text(
                          'Nike Air Zoom Pegasus 36 Miami',
                          style: TextStyle(
                              fontSize: 20 * h, fontWeight: FontWeight.w700),
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/like.svg',
                        width: 24 * w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10 * h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 16 * w,
                      ),
                      SvgPicture.asset('assets/icons/star.svg'),
                      SvgPicture.asset('assets/icons/star.svg'),
                      SvgPicture.asset('assets/icons/star.svg'),
                      SvgPicture.asset('assets/icons/star.svg'),
                      SvgPicture.asset('assets/icons/star.svg'),
                    ],
                  ),
                  SizedBox(
                    height: 16 * h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16 * w),
                    child: Text(
                      'UZS 293 000',
                      style: TextStyle(
                          fontSize: 20 * h,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.blueFF),
                    ),
                  ),
                  SizedBox(
                    height: 24 * h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16 * w),
                    child: Text(
                      'O\'lchamni tanlang',
                      style: TextStyle(
                        fontSize: 14 * h,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12 * h,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      height: 48 * h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(left: 16 * w),
                              width: 48 * h,
                              height: 48 * h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: AppTheme.greyB1.withOpacity(0.3))),
                              child: Center(
                                child: Text(index.toString()),
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 24 * h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16 * w),
                    child: Text(
                      'Rangini tanlang',
                      style: TextStyle(
                        fontSize: 14 * h,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12 * h,
                  ),
                  SizedBox(
                    height: 48 * h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(left: 16 * w),
                            width: 48 * h,
                            height: 48 * h,
                            decoration: BoxDecoration(
                              color: AppTheme.purple,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Container(
                                width: 16 * h,
                                height: 16 * h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppTheme.white),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 12 * h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16 * w),
                    child: Text(
                      'Ta\'rif',
                      style: TextStyle(
                        fontSize: 14 * h,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16 * w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shown:",
                          style: TextStyle(
                              fontSize: 12 * h, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                            width: 171 * w,
                            child: Text(
                              'Laser Blue/Anthracite/Watermelon/White',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 12 * h, color: AppTheme.greyB1),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16 * h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16 * w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Style:",
                          style: TextStyle(
                              fontSize: 12 * h, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'CD0113-400',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 12 * h, color: AppTheme.greyB1),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16 * w,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16 * w),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Nike Air Max 270 React ENG beqiyos qulaylik va ajoyib vizual tajriba uchun toʻliq uzunlikdagi React koʻpikli oʻrta taglikni 270 Max Air birligi bilan birlashtiradi.',
                      style:
                          TextStyle(fontSize: 12 * h, color: AppTheme.greyB1),
                    ),
                  ),
                  SizedBox(
                    height: 24 * h,
                  ),
                  SectionBarWidget(
                      leftTitle: 'Mahsulotni ko\'rib chiqish',
                      rightTitle: 'Batafsil',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ReviewScreen();
                          }),
                        );
                      }),
                  Row(
                    children: [
                      SizedBox(
                        width: 16 * w,
                      ),
                      SvgPicture.asset('assets/icons/star.svg'),
                      SvgPicture.asset('assets/icons/star.svg'),
                      SvgPicture.asset('assets/icons/star.svg'),
                      SvgPicture.asset('assets/icons/star.svg'),
                      SvgPicture.asset('assets/icons/star.svg'),
                      SizedBox(
                        width: 8 * w,
                      ),
                      Text(
                        '4.5 ',
                        style: TextStyle(
                            fontSize: 10 * h,
                            color: AppTheme.greyB1,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        ' (5 Ko‘rib chiqish)',
                        style:
                            TextStyle(fontSize: 10 * h, color: AppTheme.greyB1),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16 * w,
                  ),
                  Column(
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
                  ),
                  SizedBox(
                    height: 20 * h,
                  ),
                  SizedBox(
                    height: 23 * h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16 * w),
                    child: Text(
                      'Sizga yoqishi mumkin',
                      style: TextStyle(
                        fontSize: 14 * h,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12 * h,
                  ),
                  SizedBox(
                    height: 238 * h,
                    child: ListView.builder(
                      itemCount: 9,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ProductWidget(
                        image:
                            "https://media.jdsports.com/i/jdsports/JD_011922_Womens_Shoes_Nike_Midspot_600x600",
                        name: 'FS - Nike Air Max 270 React...',
                        price: 300,
                        oldPrice: 350,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailScreen(
                                  id: 1,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ButtonWidget(
              margin: EdgeInsets.only(
                  left: 16 * w,
                  right: 16 * w,
                  bottom: Platform.isIOS ? 32 : 24),
              width: MediaQuery.of(context).size.width,
              text: 'Savatga qo\'shish',
              color: AppTheme.blueFF,
              height: 57 * h,
              onTap: () {},
            ),
          ],
        ));
  }
}
