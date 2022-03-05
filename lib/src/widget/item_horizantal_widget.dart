import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lafyu/src/model/flash_sale_model.dart';
import 'package:lafyu/src/model/api/product_list_model.dart';

import '../app_theme/app_theme.dart';
import '../utils/utils.dart';

class ItemHorizontalWidget extends StatefulWidget {
  final ProductListResult data;
  final String image;
  double  discountPercent;

    ItemHorizontalWidget({Key? key, required this.data,required this.discountPercent, required this.image}) : super(key: key);

  @override
  _ItemHorizontalWidgetState createState() => _ItemHorizontalWidgetState();
}

class _ItemHorizontalWidgetState extends State<ItemHorizontalWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 16 * w,
          ),
          height: 243 * h,
          width: 141 * w,
          padding: EdgeInsets.all(
            16 * o,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppTheme.border,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5 * o),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 109 * o,
                width: 109 * o,
                margin: EdgeInsets.only(
                  bottom: 8 * h,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(5 * o),
                  border: Border.all(
                    color: AppTheme.border,
                    width: 1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5 * o),
                  child: CachedNetworkImage(
                    imageUrl: widget.image,
                  ),
                ),
              ),
              Text(
                widget.data.name,
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  fontSize: 12 * o,
                  color: AppTheme.dark63,
                  fontFamily: AppTheme.fontFamilyPoppins,
                ),
              ),
              Row(
                children: [
                  Container(
                    child: Text(
                      "\$" + widget.data.price.toString(),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 12 * o,
                        color: AppTheme.blueFF,
                        fontFamily: AppTheme.fontFamilyPoppins,
                      ),
                    ),
                    margin: EdgeInsets.only(
                      bottom: 8 * h,
                      top: 8 * h,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "\$" + widget.data.discountPrice.toString(),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      fontSize: 10 * o,
                      color: AppTheme.greyB1,
                      fontFamily: AppTheme.fontFamilyPoppins,
                    ),
                  ),
                  SizedBox(
                    width: 8 * w,
                  ),
                  Text(
                    widget.discountPercent.toString() + "% Off",
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: 10 * o,
                      color: AppTheme.red,
                      fontFamily: AppTheme.fontFamilyPoppins,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
