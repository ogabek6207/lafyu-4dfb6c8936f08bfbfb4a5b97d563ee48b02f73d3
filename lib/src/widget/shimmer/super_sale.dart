import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class SuperSaleShimmer extends StatelessWidget {
  const SuperSaleShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    return Shimmer.fromColors(
      baseColor: AppTheme.shimmerBaseColor,
      highlightColor: AppTheme.shimmerHighColor,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 12 * h,
                  bottom: 24 * h,
                ),
                height: 191 * h,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 24 * w),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, position) {
                    return Container(
                      height: 206 * h,
                      width: MediaQuery.of(context).size.width * w - 60 * w,
                      margin: EdgeInsets.only(
                        right: 16 * w,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
    ;
  }
}
