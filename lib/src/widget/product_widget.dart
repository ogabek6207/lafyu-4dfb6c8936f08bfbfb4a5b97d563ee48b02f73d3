import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';

import '../utils/utils.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.onTap,
  }) : super(key: key);

  final String image, name;
  final double price, oldPrice;
  final Function() onTap;

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    double w = Utils.windowWidth(context);
    double h = Utils.windowHeight(context);
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16 * w),
        margin: EdgeInsets.only(left: 16 * w),
        width: 141 * w,
        height: 238 * h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppTheme.greyB1.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16 * h,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppTheme.blueFF,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 8 * h,
            ),
            Expanded(
              child: SizedBox(
                width: 109 * w,
                child: Text(
                  widget.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12 * h,
                    fontFamily: AppTheme.fontFamilyPoppins,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8 * h,
            ),
            Container(
              width: 109 * w,
              child: Text(
                '\$' + widget.price.toString(),
                style: TextStyle(
                  fontSize: 12 * h,
                  color: AppTheme.blueFF,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: 16 * h,
                top: 8,
              ),
              child: Row(
                children: [
                  Text(
                    '\$' + widget.oldPrice.toInt().toString(),
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.normal,
                        fontFamily: AppTheme.fontFamilyPoppins,
                        letterSpacing: 0.5,
                        color: AppTheme.greyB1,
                        fontSize: 10 * h),
                  ),
                  SizedBox(
                    width: 8 * w,
                  ),
                  Text(
                    (100 - 100 * widget.price ~/ widget.oldPrice).toString() +
                        '%' + " Off",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.red,
                        letterSpacing: 0.5,
                        fontSize: 10 * h),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
