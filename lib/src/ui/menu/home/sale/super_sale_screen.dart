import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/model/api/product_list_model.dart';
import 'package:lafyu/src/model/api/super_sale_model.dart';
import 'package:lafyu/src/widget/app_widget.dart';

import '../../../../bloc/super_flash_sale_bloc.dart';
import '../../../../utils/utils.dart';
import '../../../../widget/product_list/product_widget.dart';

class SuperSaleScreen extends StatefulWidget {
  final int id;

  const SuperSaleScreen({Key? key, required this.id}) : super(key: key);

  @override
  _SuperSaleScreenState createState() => _SuperSaleScreenState();
}

class _SuperSaleScreenState extends State<SuperSaleScreen> {
  SuperSaleModel? superSaleModel;
  int gridCount = 2;

  int activateIndex = 0;

  @override
  void initState() {
    superFlashSaleBloc.getSuperSale(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return StreamBuilder<SuperSaleModel>(
      stream: superFlashSaleBloc.fetchSuperSale,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          SuperSaleModel superSaleModel = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppTheme.white,
              elevation: 1,
              title: const AppBarWidget(
                title: 'Super Flash Sale',
              ),
              actions: [
                SvgPicture.asset(
                  "assets/icons/search1.svg",
                ),
                SizedBox(
                  width: 16 * w,
                ),
              ],
            ),
            body: ListView(
              children: [
                SizedBox(
                  height: 16 * h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 206 * h,
                  margin: EdgeInsets.symmetric(horizontal: 16 * w),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(superSaleModel.image)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 32 * h,
                              left: 24 * w,
                              right: 32 * w,
                              bottom: 16 * h),
                          child: Text(
                            superSaleModel.name,
                            style: TextStyle(
                              fontSize: 24 * h,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.white,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 24 * w,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 32 * h),
                            width: 41 * h,
                            height: 41 * h,
                            decoration: BoxDecoration(
                              color: AppTheme.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                superSaleModel.endDate.hour.toString(),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12 * w,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 32 * h),
                            width: 41 * h,
                            height: 41 * h,
                            decoration: BoxDecoration(
                              color: AppTheme.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                superSaleModel.endDate.minute.toString(),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12 * w,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 32 * h),
                            width: 41 * h,
                            height: 41 * h,
                            decoration: BoxDecoration(
                              color: AppTheme.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                superSaleModel.endDate.second.toString(),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                StreamBuilder<SuperSaleModel>(
                  stream: superFlashSaleBloc.fetchSuperSale,
                  builder: (context, snapshot) {
                    if (snapshot.hasData || superSaleModel != null) {
                      if (snapshot.hasData) {}
                      List<ProductListResult> productResult =
                          superSaleModel.product;
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 16 * w),
                                      Expanded(
                                        child: ProductWidget(
                                          star: true,
                                          height: 282 * h,
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  48 * w) /
                                              2,
                                          data:
                                              productResult[index * gridCount],
                                        ),
                                      ),
                                      SizedBox(width: 16 * w),
                                      Expanded(
                                        child: index * gridCount + 1 >=
                                                productResult.length
                                            ? Container()
                                            : ProductWidget(
                                                star: true,
                                                height: 282 * h,
                                                width: (MediaQuery.of(context)
                                                            .size
                                                            .width -
                                                        48 * w) /
                                                    2,
                                                data: productResult[
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
                            itemCount: (productResult.length + gridCount - 1) ~/
                                gridCount,
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
        return Container();
      },
    );
  }
}
