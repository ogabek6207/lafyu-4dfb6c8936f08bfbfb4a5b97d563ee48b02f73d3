import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyu/src/bloc/home_bloc.dart';
import 'package:lafyu/src/model/api/product_list_model.dart';
import 'package:lafyu/src/widget/app_widget.dart';
import 'package:lafyu/src/widget/favourite/favourite_widget.dart';

import '../../app_theme/app_theme.dart';
import '../../utils/utils.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  int gridCount = 2;

  @override
  void initState() {
    homeSaleBloc.getDataBaseProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.white,
        elevation: 1,
        title: const AppBarWidget(
          title: 'Favorite Product',
        ),
      ),
      backgroundColor: AppTheme.white,
      body: StreamBuilder<List<ProductListResult>>(
        stream: homeSaleBloc.fetchProduct,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductListResult> homeResult = snapshot.data!;
            return Column(
              children: [
                SizedBox(
                  height: 16 * h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 16 * w),
                            Expanded(
                              child: FavouriteWidget(
                                star: true,
                                height: 282 * h,
                                width: (MediaQuery.of(context).size.width -
                                        48 * w) /
                                    2,
                                data: homeResult[index * gridCount],
                              ),
                            ),
                            SizedBox(width: 16 * w),
                            Expanded(
                              child: index * gridCount + 1 >= homeResult.length
                                  ? Container()
                                  : FavouriteWidget(
                                      star: true,
                                      height: 282 * h,
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  48 * w) /
                                              2,
                                      data: homeResult[index * gridCount + 1],
                                    ),
                            ),
                            SizedBox(width: 16 * w),
                          ],
                        ),
                        SizedBox(height: 16 * h),
                      ],
                    );
                  },
                  itemCount: (homeResult.length + gridCount - 1) ~/ gridCount,
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
