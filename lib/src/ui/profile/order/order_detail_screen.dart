import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyu/src/widget/app_widget.dart';
import 'package:lafyu/src/widget/save_widget.dart';

import '../../../app_theme/app_theme.dart';
import '../../../utils/utils.dart';
import '../address/address_screen.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  bool isFav = false;
  bool isFav1 = false;

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.white,
        elevation: 1,
        title: const   AppBarWidget(title: "Order Details"),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(
                top: 16 * h,
              ),
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 24 * h),
                  child: SvgPicture.asset(
                    "assets/icons/icon.svg",
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 16 * w,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Product",
                            style: TextStyle(
                              color: AppTheme.dark63,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              fontSize: 14 * o,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 104 * h,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                          top: 12 * h,
                          right: 16 * w,
                        ),
                        padding: EdgeInsets.all(
                          16 * o,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(
                            5 * o,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 72 * o,
                              height: 72 * o,
                              margin: EdgeInsets.only(
                                right: 12 * w,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  5 * o,
                                ),
                                child: Image.asset(
                                  "assets/images/product1.png",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 158 * w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nike Air Zoom Pegasus 36 Miami",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: AppTheme.dark63,
                                      fontSize: 12 * o,
                                      height: 1.5,
                                      fontFamily: AppTheme.fontFamilyPoppins,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 11 * w,
                                    ),
                                    child: Text(
                                      "\$299,43",
                                      style: TextStyle(
                                        color: AppTheme.blueFF,
                                        fontSize: 12 * o,
                                        height: 1.5,
                                        fontFamily: AppTheme.fontFamilyPoppins,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isFav1 = !isFav1;
                                });
                              },
                              child: isFav1
                                  ? SvgPicture.asset(
                                      "assets/icons/like_red.svg")
                                  : SvgPicture.asset("assets/icons/like.svg"),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 104 * h,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                          top: 12 * h,
                          bottom: 24 * h,
                          right: 16 * w,
                        ),
                        padding: EdgeInsets.all(
                          16 * o,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(
                            5 * o,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 72 * o,
                              height: 72 * o,
                              margin: EdgeInsets.only(
                                right: 12 * w,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  5 * o,
                                ),
                                child: Image.asset(
                                  "assets/images/product1.png",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 158 * w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nike Air Zoom Pegasus 36 Miami",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: AppTheme.dark63,
                                      fontSize: 12 * o,
                                      height: 1.5,
                                      fontFamily: AppTheme.fontFamilyPoppins,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 11 * w,
                                    ),
                                    child: Text(
                                      "\$299,43",
                                      style: TextStyle(
                                        color: AppTheme.blueFF,
                                        fontSize: 12 * o,
                                        height: 1.5,
                                        fontFamily: AppTheme.fontFamilyPoppins,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isFav = !isFav;
                                });
                              },
                              child: isFav
                                  ? SvgPicture.asset(
                                      "assets/icons/like_red.svg")
                                  : SvgPicture.asset("assets/icons/like.svg"),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Shipping Details",
                            style: TextStyle(
                              color: AppTheme.dark63,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              fontSize: 14 * o,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 12 * h,
                          right: 16 * w,
                          bottom: 24 * h,
                        ),
                        padding: EdgeInsets.only(
                          left: 16 * w,
                          right: 16 * w,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                          ),
                          borderRadius: BorderRadius.circular(5 * o),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 12 * h,
                              ),
                              color: AppTheme.border,
                              height: 1,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 12 * h,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Date Shipping",
                                      style: TextStyle(
                                        color: AppTheme.dark63.withOpacity(0.5),
                                        fontSize: 12 * o,
                                        fontWeight: FontWeight.normal,
                                        height: 1.8,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: AppTheme.fontFamilyPoppins,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "January 16, 2015",
                                    style: TextStyle(
                                      color: AppTheme.dark63,
                                      fontSize: 12 * o,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: AppTheme.fontFamilyPoppins,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 12 * h,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Shipping",
                                      style: TextStyle(
                                        color: AppTheme.dark63.withOpacity(0.5),
                                        fontSize: 12 * o,
                                        fontWeight: FontWeight.normal,
                                        height: 1.8,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: AppTheme.fontFamilyPoppins,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "POS Regular",
                                    style: TextStyle(
                                      color: AppTheme.dark63,
                                      fontSize: 12 * o,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: AppTheme.fontFamilyPoppins,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 12 * h,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "No. Resi",
                                      style: TextStyle(
                                        color: AppTheme.dark63.withOpacity(0.5),
                                        fontSize: 12 * o,
                                        fontWeight: FontWeight.normal,
                                        height: 1.8,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: AppTheme.fontFamilyPoppins,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "000192848573",
                                    style: TextStyle(
                                      color: AppTheme.dark63,
                                      fontSize: 12 * o,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: AppTheme.fontFamilyPoppins,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 12 * h,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Address",
                                      style: TextStyle(
                                        color: AppTheme.dark63.withOpacity(0.5),
                                        fontSize: 12 * o,
                                        fontWeight: FontWeight.normal,
                                        height: 1.8,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: AppTheme.fontFamilyPoppins,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 66 * h,
                                      width: 166 * w,
                                      child: Text(
                                        "2727 Lakeshore Rd undefined Nampa, Tennessee 78410",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        maxLines: 3,
                                        style: TextStyle(
                                          color: AppTheme.dark63,
                                          fontSize: 12 * o,
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FontStyle.normal,
                                          fontFamily:
                                              AppTheme.fontFamilyPoppins,
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
                Container(
                  margin: EdgeInsets.only(
                    left: 16 * w,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Payment Details",
                            style: TextStyle(
                              color: AppTheme.dark63,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              fontSize: 14 * o,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 12 * h,
                          right: 16 * w,
                          bottom: 24 * h,
                        ),
                        padding: EdgeInsets.only(
                          left: 16 * w,
                          right: 16 * w,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                          ),
                          borderRadius: BorderRadius.circular(5 * o),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 12 * h,
                              ),
                              color: AppTheme.border,
                              height: 1,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 12 * h,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Items (3)",
                                      style: TextStyle(
                                        color: AppTheme.dark63.withOpacity(0.5),
                                        fontSize: 12 * o,
                                        fontWeight: FontWeight.normal,
                                        height: 1.8,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: AppTheme.fontFamilyPoppins,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "\$598.86",
                                    style: TextStyle(
                                      color: AppTheme.dark63,
                                      fontSize: 12 * o,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: AppTheme.fontFamilyPoppins,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 12 * h,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Shipping",
                                      style: TextStyle(
                                        color: AppTheme.dark63.withOpacity(0.5),
                                        fontSize: 12 * o,
                                        fontWeight: FontWeight.normal,
                                        height: 1.8,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: AppTheme.fontFamilyPoppins,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "\$40.00",
                                    style: TextStyle(
                                      color: AppTheme.dark63,
                                      fontSize: 12 * o,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: AppTheme.fontFamilyPoppins,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 12 * h,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Import charges",
                                      style: TextStyle(
                                        color: AppTheme.dark63.withOpacity(0.5),
                                        fontSize: 12 * o,
                                        fontWeight: FontWeight.normal,
                                        height: 1.8,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: AppTheme.fontFamilyPoppins,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "\$128.00",
                                    style: TextStyle(
                                      color: AppTheme.dark63,
                                      fontSize: 12 * o,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: AppTheme.fontFamilyPoppins,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 12 * h,
                              ),
                              child: Row(
                                // Dashed line
                                children: [
                                  for (int i = 0; i < 64; i++)
                                    Container(
                                      width: 5,
                                      height: 1,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 1,
                                            color: i % 2 == 0
                                                ? const Color.fromRGBO(
                                                    214, 211, 211, 1)
                                                : Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                bottom: 12 * h,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Total Price",
                                      style: TextStyle(
                                        color: AppTheme.dark63,
                                        fontSize: 12 * o,
                                        fontWeight: FontWeight.bold,
                                        height: 1.5,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: AppTheme.fontFamilyPoppins,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        bottom: 16 * h,
                                      ),
                                      width: 166 * w,
                                      child: Text(
                                        "\$766.86",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: AppTheme.blueFF,
                                          fontSize: 12 * o,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                          fontFamily:
                                              AppTheme.fontFamilyPoppins,
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
              ],
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
            child: SaveWidget(title: "Notify Me"),
          ),
        ],
      ),
    );
  }
}
