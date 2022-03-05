import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import '../utils/utils.dart';

class CategoryWidget extends StatelessWidget {
  final String image, name;
  final Function() onTap;
  final double width;
  final double height;
  final EdgeInsets margin;

  const CategoryWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.onTap,
    required this.width,
    required this.height,
    required this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.windowWidth(context);
    double h = Utils.windowHeight(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        margin:margin,
        child: Column(
          children: [
            Container(
              width: 70 * h,
              height: 70 * h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: AppTheme.greyB1.withOpacity(0.3),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50 * h),
                child: Image.network(
                  image,
                ),
              ),
            ),
            SizedBox(
              height: 8 * h,
            ),
            SizedBox(
              child: Center(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10 * h,
                    color: AppTheme.greyB1,
                  ),
                ),
              ),
              width: 70 * w,
            ),
          ],
        ),
      ),
    );
  }
}
