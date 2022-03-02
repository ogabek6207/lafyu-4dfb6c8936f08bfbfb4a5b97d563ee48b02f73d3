import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';

import '../utils/utils.dart';

class RecomendedWidget extends StatelessWidget {
  final String name,subName,image;
  final Function() onTap;
  const RecomendedWidget({
    Key? key,
    required this.onTap,
    required this.name,
    required this.image,
    required this.subName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = Utils.windowWidth(context);
    double h = Utils.windowHeight(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 48 * h, left: 24 * w),
        margin: EdgeInsets.symmetric(horizontal: 16 * w),
        width: MediaQuery.of(context).size.width,
        height: 206 * h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:  DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    image)
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 169 * w,
              child: Text(name, style: TextStyle(
                  fontSize: 24 * h,
                  color: AppTheme.white,
                  fontWeight: FontWeight.w700),),
            ),
            SizedBox(height: 16 * h,),
            Text(subName,
              style: TextStyle(fontSize: 16 * h, color: AppTheme.white),)
          ],
        ),
      ),
    );

  }
}
