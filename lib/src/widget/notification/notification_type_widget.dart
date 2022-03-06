import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../app_theme/app_theme.dart';
import '../../utils/utils.dart';

class NotificationTypeWidget extends StatefulWidget {
  final String image;
  final String name;
  final int count;

  const NotificationTypeWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.count,
  }) : super(key: key);

  @override
  _NotificationTypeWidgetState createState() => _NotificationTypeWidgetState();
}

class _NotificationTypeWidgetState extends State<NotificationTypeWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Container(
      height: 56,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        left: 16 * w,
        top: 16 * h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                child: CachedNetworkImage(
                  imageUrl: widget.image,
                  placeholder: (context, url) =>
                  const CircularProgressIndicator.adaptive(),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
                height: 24 * h,
                width: 24 * h,
              ),
              SizedBox(
                width: 16 * w,
              ),
              Expanded(
                child: Text(
                  widget.name,
                  style: TextStyle(
                    letterSpacing: 0.5,
                    color: AppTheme.dark63,
                    fontFamily: AppTheme.fontFamilyPoppins,
                    fontWeight: FontWeight.bold,
                    fontSize: 12 * o,
                    fontStyle: FontStyle.normal,
                    height: 1.5 * h,
                  ),
                ),
              ),
              Container(
                height: 20*h,
                width: 20*h,
                decoration: BoxDecoration(
                  color: AppTheme.red,
                  borderRadius:
                  BorderRadius.circular(10 * o),

                ),
                child: Center(
                  child: Text(widget.count.toString(),


                  style: TextStyle(
                    color: AppTheme.white,
                    fontFamily: AppTheme.fontFamilyPoppins,
                    fontStyle: FontStyle.normal,
                    fontSize: 10*h,
                    fontWeight: FontWeight.bold,
                    height: 1.5*h,
                  ),

                  ),
                ),
                margin: EdgeInsets.only(right: 16*w),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
