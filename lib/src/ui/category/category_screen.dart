import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/bloc/all_sale_bloc.dart';
import 'package:lafyu/src/model/api/product_list_model.dart';
import 'package:lafyu/src/widget/app_widget.dart';
import 'package:lafyu/src/widget/product_list/product_widget.dart';

import '../../utils/utils.dart';

class CategoryScreen extends StatefulWidget {
  final int id;

  const CategoryScreen({Key? key, required this.id}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  ProductListModel? allSaleModel;
  int gridCount = 2;

  @override
  void initState() {
    if (widget.id == 1) {
      allSaleBloc.getFlashSale();
    } else if (widget.id == 2) {
      allSaleBloc.getMegaSale();
    } else if (widget.id == 3) {
      allSaleBloc.getHomeSale();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        automaticallyImplyLeading: false,
        elevation: 1,
        title: const AppBarWidget(
          title: 'All Product',
        ),
      ),
      body: ListView(
        children: [
          StreamBuilder<ProductListModel>(
            stream: allSaleBloc.fetchHomeSale,
            builder: (context, snapshot) {
              if (snapshot.hasData || allSaleModel != null) {
                if (snapshot.hasData) {
                  allSaleModel = snapshot.data;
                }
                List<ProductListResult> allSaleResult = allSaleModel!.results;
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
                                  child: ProductWidget(
                                    star: true,
                                    height: 282 * h,
                                    width: (MediaQuery.of(context).size.width -
                                            48 * w) /
                                        2,
                                    data: allSaleResult[index * gridCount],
                                  ),
                                ),
                                SizedBox(width: 16 * w),
                                Expanded(
                                  child: index * gridCount + 1 >=
                                          allSaleResult.length
                                      ? Container()
                                      : ProductWidget(
                                          star: true,
                                          height: 282 * h,
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  48 * w) /
                                              2,
                                          data: allSaleResult[
                                              index * gridCount + 1],
                                        ),
                                ),
                                SizedBox(width: 16 * w),
                              ],
                            ),
                            SizedBox(height: 16 * h),
                          ],
                        );
                      },
                      itemCount:
                          (allSaleResult.length + gridCount - 1) ~/ gridCount,
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  Future<void> allSale(int id) async {}
}
