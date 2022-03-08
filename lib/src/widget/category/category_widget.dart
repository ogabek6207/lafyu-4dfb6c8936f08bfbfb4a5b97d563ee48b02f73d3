import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';

import '../../utils/utils.dart';

class CategoryWidget extends StatefulWidget {
  final String icon;
  final String name;

  const CategoryWidget({Key? key, required this.icon, required this.name})
      : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Container(
      height: 56 * h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16 * w, right: 16 * w),
      child: Row(
        children: [
          Container(
            height: 24 * h,
            width: 24 * h,
            child: CachedNetworkImage(
              imageUrl: widget.icon,
              placeholder: (context, url) =>
                  const CircularProgressIndicator.adaptive(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          SizedBox(
            width: 16 * w,
          ),
          Expanded(
            child: Text(
              widget.name,
              style: TextStyle(
                color: AppTheme.dark63,
                height: 1.5 * h,
                fontFamily: AppTheme.fontFamilyPoppins,
                fontStyle: FontStyle.normal,
                fontSize: 12 * h,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
