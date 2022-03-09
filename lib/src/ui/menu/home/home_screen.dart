import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/bloc/category_bloc.dart';
import 'package:lafyu/src/bloc/home_bloc.dart';
import 'package:lafyu/src/bloc/super_flash_sale_bloc.dart';
import 'package:lafyu/src/model/api/category_model.dart';
import 'package:lafyu/src/model/api/home_model.dart';
import 'package:lafyu/src/model/super_flash_sale_model.dart';
import 'package:lafyu/src/ui/payment/payment_screen.dart';
import 'package:lafyu/src/ui/product_list/productList_screen.dart';
import 'package:lafyu/src/ui/favourite/favourite_screen.dart';
import 'package:lafyu/src/ui/notification/notification_type_screen.dart';
import 'package:lafyu/src/utils/utils.dart';
import 'package:lafyu/src/widget/category_widget.dart';
import 'package:lafyu/src/widget/home/carousel_widget.dart';
import 'package:lafyu/src/widget/product_list/product_widget.dart';
import 'package:lafyu/src/widget/recommend_widget.dart';
import 'package:lafyu/src/widget/searchWidget.dart';
import 'package:lafyu/src/widget/section_bar_widget.dart';
import 'package:lafyu/src/widget/shimmer/home_category.dart';
import 'package:lafyu/src/widget/shimmer/super_sale.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  final Function(int index) pageChanged;

  const HomeScreen({
    Key? key,
    required this.pageChanged,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SuperFlashSaleModel? superFlashSaleModel;
  CategoryModel? categoryModel;
  int notfication = 8;
  int gridCount = 2;

  @override
  void initState() {
    superFlashSaleBloc.getSuperFlashSale();
    homeBloc.allHomeData();
    categoryBloc.getCategory();
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
        elevation: 0,
        title: SearchWidgetHome(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const PaymentScreen();
                },
              ),
            );
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const FavouriteScreen();
                  },
                ),
              );
            },
            child: Center(
              child: SvgPicture.asset('assets/icons/like.svg'),
            ),
          ),
          SizedBox(
            width: 16 * w,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const NotificationTypeScreen();
                  },
                ),
              );
            },
            child: notfication >= 1
                ? Badge(
                    badgeColor: AppTheme.blueFF,
                    badgeContent: Text(
                      notfication.toString(),
                      style: TextStyle(color: AppTheme.white, fontSize: 10 * h),
                    ),
                    position: BadgePosition.topEnd(top: 8 * h, end: 0),
                    child: Center(
                      child: SvgPicture.asset('assets/icons/bell.svg'),
                    ),
                  )
                : Center(
                    child: SvgPicture.asset('assets/icons/bell.svg'),
                  ),
          ),
          SizedBox(
            width: 16 * w,
          ),
        ],
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.only(
          top: 4 * h,
        ),
        children: [
          StreamBuilder<SuperFlashSaleModel>(
            stream: superFlashSaleBloc.fetchSuperFlashSale,
            builder: (context, snapshot) {
              if (snapshot.hasData || superFlashSaleModel != null) {
                if (snapshot.hasData) {
                  superFlashSaleModel = snapshot.data;
                }
                return CarouselWidget(
                  data: superFlashSaleModel!.results,
                );
              }
              return const SuperSaleShimmer();
            },
          ),
          SectionBarWidget(
            leftTitle: "Category",
            rightTitle: "More Category",
            onTap: () {
              widget.pageChanged(1);
            },
          ),
          SizedBox(
            height: 144 * h,
            child: StreamBuilder<CategoryModel>(
              stream: categoryBloc.fetchCategory,
              builder: (context, snapshot) {
                if (snapshot.hasData || categoryModel != null) {
                  if (snapshot.hasData) {
                    categoryModel = snapshot.data;
                  }
                  return ListView.builder(
                    padding: EdgeInsets.only(top: 12 * h, left: 16 * w),
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryModel!.results.length,
                    itemBuilder: (context, index) => CategoryWidget(
                      image: categoryModel!.results[index].image,
                      name: categoryModel!.results[index].name,
                      height: 70 * h,
                      width: 70 * h,
                      margin: EdgeInsets.only(right: 16 * w),
                      onTap: () {},
                    ),
                  );
                }
                return const HomeCategoryShimmer();
              },
            ),
          ),
          StreamBuilder<HomeModel>(
              stream: homeBloc.getHomeData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SectionBarWidget(
                        leftTitle: "Flash Sale",
                        rightTitle: "See More",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ProductListScreen(
                                  type: 1,
                                  name: "Flash Sale",
                                );
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 274 * h,
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                            left: 16 * w,
                            top: 12 * h,
                            bottom: 24 * h,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.flashSale.length,
                          itemBuilder: (context, index) {
                            return ProductWidget(
                              height: 238 * h,
                              width: 141 * w,
                              margin: EdgeInsets.only(right: 16 * w),
                              data: snapshot.data!.flashSale[index],
                            );
                          },
                        ),
                      ),
                      SectionBarWidget(
                        rightTitle: "See More",
                        leftTitle: "Mega Sale",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ProductListScreen(
                                  type: 2,
                                  name: "Mega Sale",
                                );
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 274 * h,
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                            left: 16 * w,
                            top: 12 * h,
                            bottom: 24 * h,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.megaSale.length,
                          itemBuilder: (context, index) {
                            return ProductWidget(
                              height: 238 * h,
                              width: 141 * w,
                              margin: EdgeInsets.only(right: 16 * w),
                              data: snapshot.data!.megaSale[index],
                            );
                          },
                        ),
                      ),
                      CarouselSlider(
                        items: snapshot.data!.recomended.map((recommendResult) {
                          return Builder(builder: (BuildContext context) {
                            return RecomendedWidget(
                              image: recommendResult.image,
                              name: recommendResult.name,
                              subName: recommendResult.title,
                              onTap: () {},
                            );
                          });
                        }).toList(),
                        options: CarouselOptions(
                          height: 209 * h,
                          autoPlay: true,
                          viewportFraction: 1,
                        ),
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
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  48 * w) /
                                              2,
                                      data: snapshot
                                          .data!.homeSale[index * gridCount],
                                    ),
                                  ),
                                  SizedBox(width: 16 * w),
                                  Expanded(
                                    child: index * gridCount + 1 >=
                                            snapshot.data!.homeSale.length
                                        ? Container()
                                        : ProductWidget(
                                            star: true,
                                            height: 282 * h,
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    48 * w) /
                                                2,
                                            data: snapshot.data!.homeSale[
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
                            (snapshot.data!.homeSale.length + gridCount - 1) ~/
                                gridCount,
                      )
                    ],
                  );
                }
                return Shimmer.fromColors(
                  baseColor: AppTheme.shimmerBaseColor,
                  highlightColor: AppTheme.shimmerHighColor,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 12 * h,
                              bottom: 8 * h,
                            ),
                            height: 244 * h,
                            child: ListView.builder(
                              padding: EdgeInsets.only(left: 24 * w),
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, position) {
                                return Column(
                                  children: [
                                    Container(
                                      height: 238 * h,
                                      width: 141 * w,
                                      margin: EdgeInsets.only(
                                        right: 16 * w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppTheme.white,
                                        borderRadius:
                                            BorderRadius.circular(10 * o),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
