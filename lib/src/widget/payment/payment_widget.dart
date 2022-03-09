import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import '../../utils/utils.dart';

class PaymentWidget extends StatefulWidget {
  final Color color;

  const PaymentWidget({Key? key, required this.color}) : super(key: key);

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  String b = "6326    9124    8124    9875";

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Container(
      margin: EdgeInsets.only(left: 16 * w, right: 16 * w, top: 16 * h),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(5 * o),
      ),
      height: 190 * h,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 24 * w, top: 24 * h),
                height: 22,
                width: 36,
                child: Row(
                  children: [
                    const Spacer(),
                    SvgPicture.asset(
                      "assets/icons/ellips.svg",
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 24 * w, top: 24 * h),
                color: Colors.transparent,
                height: 22 * h,
                width: 36 * w,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/ellips.svg",
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              left: 21 * w,
              top: 31,
            ),
            child: Text(
              "6326    9124    8124    9875",
              style: TextStyle(
                color: AppTheme.white,
                fontWeight: FontWeight.bold,
                fontSize: 24 * h,
                fontStyle: FontStyle.normal,
                fontFamily: AppTheme.fontFamilyPoppins,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 19 * h,
              left: 21 * w,
            ),
          ),
        ],
      ),
    );
  }

  Future<String> getCardNumber(String a) async {
    return "6326    9124    8124    9875";
  }
}
