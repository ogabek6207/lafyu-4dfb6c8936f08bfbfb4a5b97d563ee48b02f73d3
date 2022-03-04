import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyu/src/widget/app_widget.dart';
import 'package:lafyu/src/widget/save_widget.dart';
import 'package:lafyu/src/widget/title_widget.dart';
import '../../../app_theme/app_theme.dart';
import '../../../utils/utils.dart';
import 'add_address_screen.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
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
        title: const AppBarWidget(title: "Address"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppTheme.border,
                    ),
                    borderRadius: BorderRadius.circular(
                      5 * o,
                    ),
                  ),
                  margin:
                      EdgeInsets.only( top: 16*h,  left: 16 * w, right: 16 * w),
                  padding: EdgeInsets.all(
                    24 * o,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const TitleWidget(title: "Prisceklla"),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 16 * h,
                          top: 16*h,
                        ),
                        child: Text(
                          "3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States",
                          style: TextStyle(
                            color: AppTheme.greyB1,
                            fontSize: 12 * o,
                            height: 1.8,
                            fontWeight: FontWeight.normal,
                            fontFamily: AppTheme.fontFamilyPoppins,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 16 * h,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "+99 1234567890",
                              style: TextStyle(
                                color: AppTheme.greyB1,
                                fontSize: 12 * o,
                                height: 1.8,
                                fontWeight: FontWeight.normal,
                                fontFamily: AppTheme.fontFamilyPoppins,
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 57 * h,
                            width: 77 * h,
                            decoration: BoxDecoration(
                              color: AppTheme.blueFF,
                              borderRadius: BorderRadius.circular(5 * o),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 30,
                                  spreadRadius: 0,
                                  color: AppTheme.blueFF.withOpacity(0.24),
                                  offset: Offset(
                                    0,
                                    10 * o,
                                  ),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                  color: AppTheme.white,
                                  fontSize: 14 * o,
                                  height: 1.8,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppTheme.fontFamilyPoppins,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 24 * w,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/korzinka.svg",
                            ),
                          ),
                        ],
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
                  builder: (context) => const AddAddressScreen(),
                ),
              );
            },
            child: SaveWidget(title: "Add Address"),
          ),
        ],
      ),
    );
  }
}
