import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/bloc/product_list_bloc.dart';
import 'package:lafyu/src/model/api/product_list_model.dart';
import 'package:lafyu/src/widget/app_widget.dart';
import 'package:lafyu/src/widget/product_list/product_widget.dart';
import '../../utils/utils.dart';

class ProductListScreen extends StatefulWidget {
  final int type;
  final String name;

  const ProductListScreen({
    Key? key,
    required this.type,
    required this.name,
  }) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  int gridCount = 2;

  @override
  void initState() {
    productListBloc.getProduct(widget.type);
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
        title: AppBarWidget(
          title: widget.name,
        ),
      ),
      body: ListView(
        children: [
          StreamBuilder<ProductListModel>(
            stream: productListBloc.fetchHomeSale,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductListResult> allSaleResult = snapshot.data!.results;
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
