import 'package:flutter/material.dart';
import 'package:lafyu/src/widget/product_list/product_widget.dart';

import '../../utils/utils.dart';

class CategoryScreen extends StatefulWidget {
  final int id;

  const CategoryScreen({Key? key, required this.id}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      body: Column(
        children: [

          // ListView.builder(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   itemBuilder: (context, index) {
          //     return Column(
          //       children: [
          //         Row(
          //           crossAxisAlignment:
          //           CrossAxisAlignment.center,
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             SizedBox(width: 16 * w),
          //             Expanded(
          //               child: ProductWidget(
          //                 star: true,
          //                 height: 282 * h,
          //                 width: (MediaQuery.of(context)
          //                     .size
          //                     .width -
          //                     48 * w) /
          //                     2,
          //                 data:
          //                 data[index * gridCount],
          //               ),
          //             ),
          //             SizedBox(width: 16 * w),
          //             Expanded(
          //               child: index * gridCount + 1 >=
          //                   productResult.length
          //                   ? Container()
          //                   : ProductWidget(
          //                 star: true,
          //                 height: 282 * h,
          //                 width: (MediaQuery.of(context)
          //                     .size
          //                     .width -
          //                     48 * w) /
          //                     2,
          //                 data: productResult[
          //                 index * gridCount + 1],
          //               ),
          //             ),
          //             SizedBox(width: 16 * w),
          //           ],
          //         ),
          //         SizedBox(height: 16 * h),
          //       ],
          //     );
          //   },
          //   itemCount: (productResult.length + gridCount - 1) ~/
          //       gridCount,
          // ),
        ],
      ),
    );
  }
}
