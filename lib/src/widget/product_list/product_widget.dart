import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/bloc/home_bloc.dart';
import 'package:lafyu/src/model/api/product_list_model.dart';
import 'package:lafyu/src/ui/product/detail_screen.dart';

import '../../utils/utils.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    Key? key,
    required this.data,
    this.margin = EdgeInsets.zero,
    this.width = 141,
    this.height = 238,
    this.star = false,
  }) : super(key: key);

  final ProductListResult data;
  final EdgeInsets margin;
  final double height;
  final double width;
  final bool star;

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool like = false;

  @override
  Widget build(BuildContext context) {
    double w = Utils.windowWidth(context);
    double h = Utils.windowHeight(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return DetailScreen(
              id: widget.data.id,
              favSelected: widget.data.favSelected,
            );
          }),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16 * w),
        margin: widget.margin,
        width: widget.width,
        height: widget.height,
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
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: widget.data.images.image,
                    width: widget.width - 32 * w,
                    height: widget.width - 32 * w,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator.adaptive(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        homeBloc.updateFavProduct(
                          widget.data,
                        );
                      },
                      child: widget.data.favSelected
                          ? SvgPicture.asset("assets/icons/like_red.svg")
                          : SvgPicture.asset("assets/icons/like.svg"),
                    ),
                    SizedBox(
                      width: 4 * w,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8 * h,
            ),
            Text(
              widget.data.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12 * h,
                fontFamily: AppTheme.fontFamilyPoppins,
                fontWeight: FontWeight.w700,
              ),
            ),
            widget.star
                ? Container(
                    margin: EdgeInsets.only(top: 4 * h),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/star.svg",
                        ),
                        SvgPicture.asset(
                          widget.data.reviewAvg > 1
                              ? "assets/icons/star.svg"
                              : "assets/icons/star1.svg",
                        ),
                        SvgPicture.asset(
                          widget.data.reviewAvg > 2
                              ? "assets/icons/star.svg"
                              : "assets/icons/star1.svg",
                        ),
                        SvgPicture.asset(
                          widget.data.reviewAvg > 3
                              ? "assets/icons/star.svg"
                              : "assets/icons/star1.svg",
                        ),
                        SvgPicture.asset(
                          widget.data.reviewAvg > 4
                              ? "assets/icons/star.svg"
                              : "assets/icons/star1.svg",
                        ),
                      ],
                    ),
                  )
                : Container(),
            const Spacer(),
            Text(
              '\$' + widget.data.price.toString(),
              style: TextStyle(
                fontSize: 12 * h,
                color: AppTheme.blueFF,
                fontWeight: FontWeight.w700,
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
                    '\$' + widget.data.discountPrice.toInt().toString(),
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
                  Expanded(
                    child: Text(
                      (100 -
                                  100 *
                                      widget.data.price ~/
                                      widget.data.discountPrice)
                              .toString() +
                          '%' +
                          " Off",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.red,
                          letterSpacing: 0.5,
                          fontSize: 10 * h),
                    ),
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
