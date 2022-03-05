import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/widget/app_widget.dart';

import 'package:lafyu/src/utils/utils.dart';

import 'order_detail_screen.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
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
        title: const   AppBarWidget(title: "Order"),
      ),
      body: Column(
        children: [

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const OrderDetailScreen();
                  },
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                left: 16 * w,
                right: 16 * w,
              ),
              padding: EdgeInsets.only(
                left: 16 * w,
                right: 16 * w,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 16 * h,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "LQNSU346JK",
                          style: TextStyle(
                            color: AppTheme.dark63,
                            fontFamily: AppTheme.fontFamilyPoppins,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 14 * o,
                            letterSpacing: 0.5,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 12 * h,
                      bottom: 12 * h,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Order at Lafyuu : August 1, 2017",
                          style: TextStyle(
                            color: AppTheme.dark63.withOpacity(0.5),
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
                            "Order Status",
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
                          "Shipping",
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
                            "Items",
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
                          "2 Items purchased",
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
                            "Price",
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
                          "\$299,43",
                          style: TextStyle(
                            color: AppTheme.blueFF,
                            fontSize: 12 * o,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            fontFamily: AppTheme.fontFamilyPoppins,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
