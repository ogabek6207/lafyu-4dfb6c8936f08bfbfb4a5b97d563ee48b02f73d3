import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';

import '../../utils/utils.dart';

class NotificationWidget extends StatefulWidget {
  final String image;
  final String title;
  final String name;
  final DateTime date;

  const NotificationWidget(
      {Key? key,
      required this.name,
      required this.image,
      required this.title,
      required this.date})
      : super(key: key);

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16 * w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 12 * w),
            height: 48 * h,
            width: 48 * h,
            child: ClipRRect(
              child: CachedNetworkImage(
                imageUrl: widget.image,
                placeholder: (context, url) =>
                    const CircularProgressIndicator.adaptive(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  color: AppTheme.dark63,
                  fontWeight: FontWeight.bold,
                  fontSize: 14 * h,
                  fontStyle: FontStyle.normal,
                  fontFamily: AppTheme.fontFamilyPoppins,
                  height: 1.5,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 100,
                child: Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                  style: TextStyle(
                    color: AppTheme.greyB1,
                    fontWeight: FontWeight.normal,
                    fontSize: 12 * h,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.5,
                    fontFamily: AppTheme.fontFamilyPoppins,
                    height: 1.8,
                  ),
                ),
              ),
              Text(
                widget.date.year.toString() +
                    "-yil " +
                    widget.date.day.toString() +
                    " " +
                    Utils.getMonth(widget.date.month).toString() +
                    " " +
                    widget.date.hour.toString() +
                    ":" +
                    widget.date.minute.toString(),
                style: TextStyle(
                  color: AppTheme.dark63,
                  fontWeight: FontWeight.normal,
                  fontSize: 10 * h,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.5,
                  fontFamily: AppTheme.fontFamilyPoppins,
                  height: 1.8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
