import 'package:flutter/material.dart';
import 'package:lafyu/src/model/api/category_model.dart';
import 'package:lafyu/src/utils/utils.dart';
import 'package:lafyu/src/widget/category_widget.dart';

class CategoryListWidget extends StatelessWidget {
  final List<CategoryResult> data;

  const CategoryListWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    int gridCount = 4;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 16 * w),
                Expanded(
                  child: CategoryWidget(
                    height: 282 * h,
                    width: (MediaQuery.of(context).size.width - 48 * w) / 2,
                    onTap: () {},
                    name: data[index * gridCount].name,
                    margin: EdgeInsets.only(left: 0 * w),
                    image: data[index * gridCount].image,
                  ),
                ),
                SizedBox(width: 16 * w),
                Expanded(
                  child: index * gridCount + 1 >= data.length
                      ? Container()
                      : CategoryWidget(
                          height: 282 * h,
                          width:
                              (MediaQuery.of(context).size.width - 48 * w) / 2,
                          onTap: () {},
                          name: data[index * gridCount + 1].name,
                          margin: EdgeInsets.only(left: 0 * w),
                          image: data[index * gridCount + 1].image,
                        ),
                ),
                SizedBox(width: 16 * w),
                Expanded(
                  child: index * gridCount + 2 >= data.length
                      ? Container()
                      : CategoryWidget(
                          height: 282 * h,
                          width:
                              (MediaQuery.of(context).size.width - 48 * w) / 2,
                          onTap: () {},
                          name: data[index * gridCount + 2].name,
                          margin: EdgeInsets.only(left: 0 * w),
                          image: data[index * gridCount + 2].image,
                        ),
                ),
                SizedBox(width: 16 * w),
                Expanded(
                  child: index * gridCount + 3 >= data.length
                      ? Container()
                      : CategoryWidget(
                          height: 282 * h,
                          width:
                              (MediaQuery.of(context).size.width - 48 * w) / 2,
                          onTap: () {},
                          name: data[index * gridCount + 3].name,
                          margin: EdgeInsets.only(left: 0 * w),
                          image: data[index * gridCount + 3].image,
                        ),
                ),
                SizedBox(width: 16 * w),
              ],
            ),
            SizedBox(height: 16 * h),
          ],
        );
      },
      itemCount: (data.length + gridCount - 1) ~/ gridCount,
    );
  }
}
