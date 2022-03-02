import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyu/src/bloc/product_description_bloc.dart';
import 'package:lafyu/src/model/product_description_model.dart';

import '../../app_theme/app_theme.dart';
import '../../utils/utils.dart';

class ProductScreen extends StatefulWidget {


 int id;


 ProductScreen({Key? key, required this.id}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int activateIndex = 0;
  @override
  void initState() {
 productDescriptionBloc.getProductDescription(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      body:







      StreamBuilder(
        stream: productDescriptionBloc.fetchProductDescription,
        builder: (context, AsyncSnapshot<ProductDescriptionModel> snapshot) {
          if (snapshot.hasData) {
            ProductDescriptionModel data = snapshot.data!;
          List<ProductImage>  imageResult = snapshot.data!.images;
            return Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    top: 70 * h,
                    left: 16 * w,
                    right: 16 * w,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            right: 12 * w,
                          ),
                          height: 24 * o,
                          width: 24 * o,
                          child: SvgPicture.asset(
                            "assets/icons/arrow_left.svg",
                            height: 24 * o,
                            width: 24 * o,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Favorite Product",
                          style: TextStyle(
                            color: AppTheme.dark63,
                            fontFamily: AppTheme.fontFamilyPoppins,
                            fontSize: 16 * o,
                            height: 1.5,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SvgPicture.asset("assets/menu/search.svg"),
                    ],
                  ),
                ),
                Container(
                  height: 1 * h,
                  margin: EdgeInsets.only(top: 28 * h),
                  color: AppTheme.border,
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [




                      // CarouselSlider.builder(
                      //   itemBuilder: (context, index, realIndex) {
                      //     return  Container(
                      //       margin: EdgeInsets.only(
                      //         bottom: 16 * h,
                      //       ),
                      //       height: 238 * h,
                      //       width: MediaQuery.of(context).size.width,
                      //       child: ClipRect(
                      //         child: Image.network(
                      //           imageResult[index].image,
                      //           fit: BoxFit.cover,
                      //         ),
                      //       ),
                      //     );
                      //   },
                      //   options: CarouselOptions(
                      //     height: 206 * h,
                      //     initialPage: 0,
                      //     enlargeCenterPage: true,
                      //     enlargeStrategy: CenterPageEnlargeStrategy.height,
                      //     autoPlay: true,
                      //     autoPlayInterval: const Duration(
                      //       seconds: 10,
                      //     ),
                      //     onPageChanged: (index, reason) {
                      //       setState(() {
                      //         activateIndex = index;
                      //       });
                      //       // print(index);
                      //     },
                      //   ),
                      //   itemCount: imageResult.length,
                      // ),










                      Container(
                        width: 72 * w,
                        margin: EdgeInsets.only(
                          bottom: 16 * h,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: SvgPicture.asset(
                                "assets/icons/circle.svg",
                              ),
                              margin: EdgeInsets.only(
                                left: 4 * w,
                                right: 4 * w,
                              ),
                            ),
                            Container(
                              child: SvgPicture.asset(
                                "assets/icons/circle.svg",
                              ),
                              margin: EdgeInsets.only(
                                left: 4 * w,
                                right: 4 * w,
                              ),
                            ),
                            Container(
                              child: SvgPicture.asset(
                                "assets/icons/circle.svg",
                                color: AppTheme.blueFF,
                              ),
                              margin: EdgeInsets.only(
                                left: 4 * w,
                                right: 4 * w,
                              ),
                            ),
                            Container(
                              child: SvgPicture.asset(
                                "assets/icons/circle.svg",
                              ),
                              margin: EdgeInsets.only(
                                left: 4 * w,
                                right: 4 * w,
                              ),
                            ),
                            Container(
                              child: SvgPicture.asset(
                                "assets/icons/circle.svg",
                              ),
                              margin: EdgeInsets.only(
                                left: 4 * w,
                                right: 4 * w,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                          left: 16 * w,
                          right: 16 * w,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 275 * w,
                              margin: EdgeInsets.only(
                                bottom: 8 * h,
                              ),
                              child: Text(
                                data.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppTheme.dark63,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20 * o,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: AppTheme.fontFamilyPoppins,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 16 * w,
                          bottom: 16 * h,
                        ),
                        width: 68,
                        child: Row(
                          children: [
                            Container(
                              child: SvgPicture.asset(
                                "assets/icons/star.svg",
                                height: 16 * o,
                                width: 16 * o,
                              ),
                              margin: EdgeInsets.only(
                                right: 4 * w,
                              ),
                            ),
                            Container(
                              child: SvgPicture.asset(
                                "assets/icons/star.svg",
                                height: 16 * o,
                                width: 16 * o,
                              ),
                              margin: EdgeInsets.only(
                                right: 4 * w,
                              ),
                            ),
                            Container(
                              child: SvgPicture.asset(
                                "assets/icons/star.svg",
                                height: 16 * o,
                                width: 16 * o,
                              ),
                              margin: EdgeInsets.only(
                                right: 4 * w,
                              ),
                            ),
                            Container(
                              child: SvgPicture.asset(
                                "assets/icons/star.svg",
                                height: 16 * o,
                                width: 16 * o,
                              ),
                              margin: EdgeInsets.only(
                                right: 4 * w,
                              ),
                            ),
                            Container(
                              child: SvgPicture.asset(
                                "assets/icons/star1.svg",
                                height: 16 * o,
                                width: 16 * o,
                              ),
                              margin: EdgeInsets.only(
                                right: 4 * w,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 16 * w,
                          bottom: 24 * h,
                        ),
                        child: Text(
                          data.price.toString(),
                          style: TextStyle(
                            color: AppTheme.blueFF,
                            fontFamily: AppTheme.fontFamilyPoppins,
                            fontSize: 16 * o,
                            height: 1.5,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 16 * w,
                          bottom: 12 * h,
                        ),
                        child: Text(
                          "Select Size",
                          style: TextStyle(
                            color: AppTheme.dark63,
                            fontFamily: AppTheme.fontFamilyPoppins,
                            fontSize: 14 * o,
                            height: 1.5,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 48,
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) => Container(
                                  margin: EdgeInsets.only(
                                    left: 16 * w,
                                  ),
                                  height: 48 * o,
                                  width: 48 * h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(66 * o),
                                      border: Border.all(
                                        color: AppTheme.border,
                                        width: 1,
                                      )),
                                  child: Center(
                                    child: Text(
                                      "6",
                                      style: TextStyle(
                                        color: AppTheme.dark63,
                                        fontFamily: AppTheme.fontFamilyPoppins,
                                        fontSize: 14 * o,
                                        height: 1.5,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 24 * h,
                          left: 16 * w,
                          bottom: 12 * h,
                        ),
                        child: Text(
                          "Select Color",
                          style: TextStyle(
                            color: AppTheme.dark63,
                            fontFamily: AppTheme.fontFamilyPoppins,
                            fontSize: 14 * o,
                            height: 1.5,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 48,
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) => Container(
                                  margin: EdgeInsets.only(
                                    left: 16 * w,
                                  ),
                                  height: 48 * o,
                                  width: 48 * o,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(66 * o),
                                    color: AppTheme.red,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 24 * h,
                          left: 16 * w,
                          bottom: 12 * h,
                        ),
                        child: Text(
                          "Specification",
                          style: TextStyle(
                            color: AppTheme.dark63,
                            fontFamily: AppTheme.fontFamilyPoppins,
                            fontSize: 14 * o,
                            height: 1.5,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16 * w, right: 16 * w),
                        height: 66 * h,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Shown:",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: AppTheme.dark63,
                                      fontFamily: AppTheme.fontFamilyPoppins,
                                      fontSize: 12 * o,
                                      height: 1.5,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 66 * h,
                                  width: 171 * w,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Laser ",
                                        maxLines: 3,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: AppTheme.greyB1,
                                          fontFamily: AppTheme.fontFamilyPoppins,
                                          fontSize: 12 * o,
                                          height: 1.5,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        "Blue/Anthracite/Watermelon/White",
                                        maxLines: 3,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: AppTheme.greyB1,
                                          fontFamily: AppTheme.fontFamilyPoppins,
                                          fontSize: 12 * o,
                                          height: 1.5,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 16 * w,
                          right: 16 * w,
                          bottom: 16 * h,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Style:",
                                style: TextStyle(
                                  color: AppTheme.dark63,
                                  fontFamily: AppTheme.fontFamilyPoppins,
                                  fontSize: 12 * o,
                                  height: 1.5,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Text(
                              "CD0113-400",
                              style: TextStyle(
                                color: AppTheme.greyB1,
                                fontFamily: AppTheme.fontFamilyPoppins,
                                fontSize: 12 * o,
                                height: 1.5,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16 * w, right: 36 * w),
                        child: Text(
                          "The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppTheme.greyB1,
                            fontFamily: AppTheme.fontFamilyPoppins,
                            fontSize: 12 * o,
                            height: 1.5,
                            letterSpacing: 0.5,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 24 * h,
                                left: 16 * w,
                                bottom: 12 * h,
                              ),
                              child: Text(
                                "Review Product",
                                style: TextStyle(
                                  color: AppTheme.dark63,
                                  fontFamily: AppTheme.fontFamilyPoppins,
                                  fontSize: 14 * o,
                                  height: 1.5,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 24 * h,
                              left: 16 * w,
                              right: 16 * w,
                              bottom: 12 * h,
                            ),
                            child: Text(
                              "See More",
                              style: TextStyle(
                                color: AppTheme.blueFF,
                                fontFamily: AppTheme.fontFamilyPoppins,
                                fontSize: 14 * o,
                                height: 1.5,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 16 * w,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  child: SvgPicture.asset(
                                    "assets/icons/star.svg",
                                    height: 16 * o,
                                    width: 16 * o,
                                  ),
                                  margin: EdgeInsets.only(
                                    right: 4 * w,
                                  ),
                                ),
                                Container(
                                  child: SvgPicture.asset(
                                    "assets/icons/star.svg",
                                    height: 16 * o,
                                    width: 16 * o,
                                  ),
                                  margin: EdgeInsets.only(
                                    right: 4 * w,
                                  ),
                                ),
                                Container(
                                  child: SvgPicture.asset(
                                    "assets/icons/star.svg",
                                    height: 16 * o,
                                    width: 16 * o,
                                  ),
                                  margin: EdgeInsets.only(
                                    right: 4 * w,
                                  ),
                                ),
                                Container(
                                  child: SvgPicture.asset(
                                    "assets/icons/star.svg",
                                    height: 16 * o,
                                    width: 16 * o,
                                  ),
                                  margin: EdgeInsets.only(
                                    right: 4 * w,
                                  ),
                                ),
                                Container(
                                  child: SvgPicture.asset(
                                    "assets/icons/star1.svg",
                                    height: 16 * o,
                                    width: 16 * o,
                                  ),
                                  margin: EdgeInsets.only(
                                    right: 8 * w,
                                  ),
                                ),
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                    color: AppTheme.greyB1,
                                    fontFamily: AppTheme.fontFamilyPoppins,
                                    fontSize: 10 * o,
                                    height: 1.5,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 3 * w),
                                  child: Text(
                                    "(5 Review)",
                                    style: TextStyle(
                                      color: AppTheme.greyB1,
                                      fontFamily: AppTheme.fontFamilyPoppins,
                                      fontSize: 10 * o,
                                      height: 1.5,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 48 * h,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                          top: 16 * h,
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: 16 * w,
                                right: 16 * w,
                              ),
                              height: 48 * o,
                              width: 48 * o,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24 * o),
                              ),
                              child: ClipRRect(
                                child: Image.asset("assets/images/user.png"),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "James Lawson",
                                  style: TextStyle(
                                    color: AppTheme.dark63,
                                    fontFamily: AppTheme.fontFamilyPoppins,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14 * o,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 4 * h,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: SvgPicture.asset(
                                          "assets/icons/star.svg",
                                          height: 16 * o,
                                          width: 16 * o,
                                        ),
                                        margin: EdgeInsets.only(
                                          right: 4 * w,
                                        ),
                                      ),
                                      Container(
                                        child: SvgPicture.asset(
                                          "assets/icons/star.svg",
                                          height: 16 * o,
                                          width: 16 * o,
                                        ),
                                        margin: EdgeInsets.only(
                                          right: 4 * w,
                                        ),
                                      ),
                                      Container(
                                        child: SvgPicture.asset(
                                          "assets/icons/star.svg",
                                          height: 16 * o,
                                          width: 16 * o,
                                        ),
                                        margin: EdgeInsets.only(
                                          right: 4 * w,
                                        ),
                                      ),
                                      Container(
                                        child: SvgPicture.asset(
                                          "assets/icons/star.svg",
                                          height: 16 * o,
                                          width: 16 * o,
                                        ),
                                        margin: EdgeInsets.only(
                                          right: 4 * w,
                                        ),
                                      ),
                                      Container(
                                        child: SvgPicture.asset(
                                          "assets/icons/star1.svg",
                                          height: 16 * o,
                                          width: 16 * o,
                                        ),
                                        margin: EdgeInsets.only(
                                          right: 8 * w,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                          top: 16 * h,
                          left: 16 * w,
                          right: 16 * w,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppTheme.greyB1,
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
                      Container(
                        margin: EdgeInsets.only(
                          top: 16 * h,
                          left: 16 * w,
                          bottom: 16 * h,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 72 * o,
                              width: 72 * o,
                              margin: EdgeInsets.only(
                                right: 12 * w,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5 * o),
                                child: Image.asset(
                                  "assets/images/product2.png",
                                ),
                              ),
                            ),
                            Container(
                              height: 72 * o,
                              width: 72 * o,
                              margin: EdgeInsets.only(
                                right: 12 * w,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5 * o),
                                child: Image.asset(
                                  "assets/images/product2.png",
                                ),
                              ),
                            ),
                            Container(
                              height: 72 * o,
                              width: 72 * o,
                              margin: EdgeInsets.only(
                                right: 12 * w,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5 * o),
                                child: Image.asset(
                                  "assets/images/product2.png",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(
                      //     left: 16 * w,
                      //     bottom: 23 * h,
                      //   ),
                      //   child: Text(
                      //     Utils.getMonth(now.month) +
                      //         " " +
                      //         now.day.toString() +
                      //         ", " +
                      //         now.year.toString(),
                      //     textAlign: TextAlign.start,
                      //     style: TextStyle(
                      //       color: AppTheme.greyB1,
                      //       fontFamily: AppTheme.fontFamilyPoppins,
                      //       fontSize: 10 * o,
                      //       height: 1.5,
                      //       letterSpacing: 0.5,
                      //       fontStyle: FontStyle.normal,
                      //       fontWeight: FontWeight.normal,
                      //     ),
                      //   ),
                      // ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 16 * w,
                        ),
                        child: Text(
                          "You Might Also Like",
                          style: TextStyle(
                            color: AppTheme.dark63,
                            fontFamily: AppTheme.fontFamilyPoppins,
                            fontSize: 14 * o,
                            height: 1.5,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 12 * h,
                          bottom: 21 * h,
                        ),
                        height: 250 * h,
                        width: 141 * w,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) => Column(
                            children: [
                              // GestureDetector(
                              //   onTap: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) {
                              //           return ProductScreen(
                              //              widget.data,
                              //           );
                              //         },
                              //       ),
                              //     );
                              //   },
                              //   child: Container(
                              //     margin: EdgeInsets.only(
                              //       left: 16 * w,
                              //     ),
                              //     height: 240,
                              //     width: 141,
                              //     padding: EdgeInsets.all(
                              //       16 * o,
                              //     ),
                              //     decoration: BoxDecoration(
                              //       border: Border.all(
                              //         color: AppTheme.border,
                              //         width: 1,
                              //       ),
                              //       borderRadius: BorderRadius.circular(5 * o),
                              //     ),
                              //     child: Column(
                              //       children: [
                              //         Container(
                              //           height: 109 * o,
                              //           width: 109 * o,
                              //           margin: EdgeInsets.only(
                              //             bottom: 8 * h,
                              //           ),
                              //           decoration: BoxDecoration(
                              //             color: AppTheme.white,
                              //             borderRadius: BorderRadius.circular(5 * o),
                              //             border: Border.all(
                              //               color: AppTheme.border,
                              //               width: 1,
                              //             ),
                              //           ),
                              //           child: ClipRect(
                              //             child: Image.asset(
                              //               "assets/images/product1.png",
                              //               fit: BoxFit.cover,
                              //             ),
                              //           ),
                              //         ),
                              //         Text(
                              //           "FS - Nike Air Max 270 React...",
                              //           maxLines: 2,
                              //           overflow: TextOverflow.ellipsis,
                              //           style: TextStyle(
                              //             fontWeight: FontWeight.bold,
                              //             fontStyle: FontStyle.normal,
                              //             fontSize: 12 * o,
                              //             color: AppTheme.dark63,
                              //             fontFamily: AppTheme.fontFamilyPoppins,
                              //           ),
                              //         ),
                              //         Row(
                              //           children: [
                              //             Container(
                              //               child: Text(
                              //                 "\$299,43",
                              //                 textAlign: TextAlign.start,
                              //                 overflow: TextOverflow.ellipsis,
                              //                 style: TextStyle(
                              //                   fontWeight: FontWeight.bold,
                              //                   fontStyle: FontStyle.normal,
                              //                   fontSize: 12 * o,
                              //                   color: AppTheme.blueFF,
                              //                   fontFamily:
                              //                   AppTheme.fontFamilyPoppins,
                              //                 ),
                              //               ),
                              //               margin: EdgeInsets.only(
                              //                 bottom: 8 * h,
                              //                 top: 8 * h,
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //         Row(
                              //           children: [
                              //             Text(
                              //               "534,33",
                              //               textAlign: TextAlign.start,
                              //               overflow: TextOverflow.ellipsis,
                              //               style: TextStyle(
                              //                 fontWeight: FontWeight.normal,
                              //                 fontStyle: FontStyle.normal,
                              //                 fontSize: 10 * o,
                              //                 color: AppTheme.greyB1,
                              //                 fontFamily: AppTheme.fontFamilyPoppins,
                              //               ),
                              //             ),
                              //             SizedBox(
                              //               width: 8 * w,
                              //             ),
                              //             Text(
                              //               "24% Off",
                              //               textAlign: TextAlign.start,
                              //               overflow: TextOverflow.ellipsis,
                              //               style: TextStyle(
                              //                 fontWeight: FontWeight.bold,
                              //                 fontStyle: FontStyle.normal,
                              //                 fontSize: 10 * o,
                              //                 color: AppTheme.red,
                              //                 fontFamily: AppTheme.fontFamilyPoppins,
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 57 * h,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    left: 16 * w,
                    right: 16 * w,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.blueFF,
                    borderRadius: BorderRadius.circular(
                      5 * o,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Add To Cart",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 14 * o,
                        color: AppTheme.white,
                        fontFamily: AppTheme.fontFamilyPoppins,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: (Platform.isIOS ? 52 : 40) * h,
                ),
              ],
            );
          }
          return Container();
        },
      ),


















    );
  }
}
