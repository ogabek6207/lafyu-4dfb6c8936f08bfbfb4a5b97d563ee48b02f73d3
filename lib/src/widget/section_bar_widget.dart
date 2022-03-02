import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import '../utils/utils.dart';

class SectionBarWidget extends StatelessWidget {
  final String rightTitle,leftTitle;
  final Function() onTap;
  const SectionBarWidget({
    Key? key,
    required this.leftTitle,
    required this.rightTitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w =  Utils.windowWidth(context);
    double h =  Utils.windowHeight(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16 * w, vertical: 12 * h),
      child: Row(
        children: [
          Text(
            leftTitle,
            style: TextStyle(
              fontSize: 14 * h,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Text(
              rightTitle,
              style: TextStyle(
                color: AppTheme.blueFF,
                fontSize: 14 * h,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
