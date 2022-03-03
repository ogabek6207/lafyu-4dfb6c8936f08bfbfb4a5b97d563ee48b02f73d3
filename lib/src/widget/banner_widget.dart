import 'package:flutter/material.dart';

import '../app_theme/app_theme.dart';
import '../utils/utils.dart';

class BannerWidget extends StatefulWidget {
  final String name, image;
  final DateTime clock;
  final Function() onTap;

  const BannerWidget({
    Key? key,
    required this.name,
    required this.image,
    required this.clock,
    required this.onTap,
  }) : super(key: key);

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    double w = Utils.windowWidth(context);
    double h = Utils.windowWidth(context);
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 206 * h,
        margin: EdgeInsets.symmetric(horizontal: 16 * w),
        decoration: BoxDecoration(
          image: DecorationImage(

              fit: BoxFit.cover, image: NetworkImage(widget.image)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    top: 32 * h, left: 24 * w, right: 32 * w, bottom: 16 * h),
                child: Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 24 * h,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.white,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 24 * w,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 32 * h),
                  width: 41 * h,
                  height: 41 * h,
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      widget.clock.hour.toString(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12 * w,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 32 * h),
                  width: 41 * h,
                  height: 41 * h,
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      widget.clock.minute.toString(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12 * w,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 32 * h),
                  width: 41 * h,
                  height: 41 * h,
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      widget.clock.second.toString(),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
