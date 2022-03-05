import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import '../utils/utils.dart';

class SearchWidgetHome extends StatelessWidget {
  final Function() onTap;

  const SearchWidgetHome({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.windowWidth(context);
    double h = Utils.windowWidth(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 46 * h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppTheme.greyB1.withOpacity(0.3),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 16 * w,
            ),
            SvgPicture.asset('assets/icons/search.svg'),
            SizedBox(
              width: 8 * w,
            ),
            Text(
              'Mahsulotni qidirish',
              style: TextStyle(
                color: AppTheme.greyB1,
                fontSize: 12 * h,
              ),
            )
          ],
        ),
      ),
    );
  }
}
