import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class HomeCategoryShimmer extends StatelessWidget {
  const HomeCategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    return Shimmer.fromColors(
      baseColor: AppTheme.shimmerBaseColor,
      highlightColor: AppTheme.shimmerHighColor,
      child: Container(
        margin: EdgeInsets.only(
          top: 12 * h,
          bottom: 8 * h,
        ),
        height: 114 * h,
        child: ListView.builder(
          padding: EdgeInsets.only(left: 24 * w),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, position) {
            return Column(
              children: [
                Container(
                  height: 70 * h,
                  width: 70 * h,
                  margin: EdgeInsets.only(
                    right: 16 * w,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                Container(
                  height: 20 * h,
                  width: 60 * h,
                  margin: EdgeInsets.only(top: 8 * h, right: 16 * w),
                  decoration: BoxDecoration(
                    color: AppTheme.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
