import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Container(
              height: 206 * h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10 * h),
                child: CachedNetworkImage(
                  imageUrl: widget.image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator.adaptive(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 32 * h,
                        left: 24 * w,
                        right: 32 * w,
                        bottom: 16 * h),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 24 * w,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 32 * h,
                        right: 4 * w,
                      ),
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
                    Container(
                        margin: EdgeInsets.only(bottom: 30 * h),
                        child: SvgPicture.asset("assets/icons/minute.svg")),
                    Container(
                      margin: EdgeInsets.only(
                          bottom: 32 * h, left: 4 * w, right: 4 * w),
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
                    Container(
                        margin: EdgeInsets.only(bottom: 30 * h),
                        child: SvgPicture.asset("assets/icons/minute.svg")),
                    Container(
                      margin: EdgeInsets.only(bottom: 32 * h, left: 4 * w),
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
          ],
        ),
      ),
    );
  }
}
