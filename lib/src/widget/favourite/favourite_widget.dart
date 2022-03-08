import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyu/src/model/api/product_list_model.dart';

import '../../app_theme/app_theme.dart';
import '../../utils/utils.dart';

class FavouriteWidget extends StatefulWidget {
 final bool star;
 final double height;
 final double width;
 final ProductListResult data;

  const FavouriteWidget(
      {Key? key,
      required this.star,
      required this.height,
      required this.width,
      required this.data})
      : super(key: key);

  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Container(
      width: 165 * w,
      margin: EdgeInsets.only(
        left: 16 * w,
        top: 16 * h,
      ),
      height: 290 * h,
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
            height: 133 * o,
            width: 133 * o,
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
            child: ClipRect(
              child: CachedNetworkImage(
                imageUrl: widget.data.images.image,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator.adaptive(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 133 * w,
              child: Text(
                widget.data.name,
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
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4 * h),
            width: 68,
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/star.svg",
                ),
                SvgPicture.asset(
                  "assets/icons/star.svg",
                ),
                SvgPicture.asset(
                  "assets/icons/star.svg",
                ),
                SvgPicture.asset(
                  "assets/icons/star.svg",
                ),
                SvgPicture.asset(
                  "assets/icons/star1.svg",
                  color: AppTheme.border,
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text(
                           "\$"+ widget.data.price.toInt().toString(),
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
                            bottom: 4 * h,
                            top: 16 * h,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 46*w,
                          child: Text(
                            "\$"+ widget.data.discountPrice.toInt().toString(),

                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              fontSize: 10 * o,
                              color: AppTheme.greyB1,
                              fontFamily: AppTheme.fontFamilyPoppins,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8 * w,
                        ),
                        Text(
                          "24% Off",
                          textAlign: TextAlign.start,
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
              SvgPicture.asset("assets/icons/korzinka.svg")
            ],
          ),
        ],
      ),
    );
  }
}
