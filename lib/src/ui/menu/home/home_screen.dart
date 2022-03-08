import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/bloc/category_bloc.dart';
import 'package:lafyu/src/bloc/home_bloc.dart';
import 'package:lafyu/src/bloc/super_flash_sale_bloc.dart';
import 'package:lafyu/src/bloc/recommend_bloc.dart';
import 'package:lafyu/src/model/api/category_model.dart';
import 'package:lafyu/src/model/api/product_list_model.dart';
import 'package:lafyu/src/model/api/recommend_model.dart';
import 'package:lafyu/src/model/super_flash_sale_model.dart';
import 'package:lafyu/src/ui/menu/explore/explore_screen.dart';
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
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SuperFlashSaleModel? superFlashSaleModel;
  RecommendModel? recommendModel;
  ProductListModel? homeModel;
  CategoryModel? categoryModel;
  int notfication = 8;
  int gridCount = 2;

  @override
  void initState() {
    superFlashSaleBloc.getSuperFlashSale();
    homeSaleBloc.getFlashSale();
    homeSaleBloc.getHomeSale();
    homeSaleBloc.getMegaSale();
    categoryBloc.getCategory();
    recommendBloc.getRecommend();
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
          onTap: () {},
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
                MaterialPageRoute(builder: (context) {
                  return const NotificationTypeScreen();
                }),
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
              return Shimmer.fromColors(
                baseColor: AppTheme.shimmerBaseColor,
                highlightColor: AppTheme.shimmerHighColor,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 12 * h,
                            bottom: 24 * h,
                          ),
                          height: 191 * h,
                          child: ListView.builder(
                            padding: EdgeInsets.only(left: 24 * w),
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, position) {
                              return Container(
                                height: 206 * h,
                                width: MediaQuery.of(context).size.width * w -
                                    60 * w,
                                margin: EdgeInsets.only(
                                  right: 16 * w,
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.white,
                                  borderRadius: BorderRadius.circular(8 * o),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              top: 16 * h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SectionBarWidget(
                  leftTitle: "Category",
                  rightTitle: "More Category",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ExploreScreen();
                        },
                      ),
                    );
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
                                  height: 114 * h,
                                  child: ListView.builder(
                                    padding: EdgeInsets.only(left: 24 * w),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10,
                                    itemBuilder: (context, position) {
                                      return Column(
                                        children: [
                                          Container(
                                            height: 70 * h,
                                            width: 70 * h,
                                            margin: EdgeInsets.only(
                                              right: 16 * w,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppTheme.white,
                                              borderRadius:
                                                  BorderRadius.circular(40 * o),
                                            ),
                                          ),
                                          Container(
                                            height: 20 * h,
                                            width: 60 * h,
                                            margin: EdgeInsets.only(
                                                top: 8 * h, right: 16 * w),
                                            decoration: BoxDecoration(
                                              color: AppTheme.red,
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
                    },
                  ),
                ),
              ],
            ),
          ),
          SectionBarWidget(
            leftTitle: "Flash Sale",
            rightTitle: "See More",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ProductListScreen(
                  type: 1,
                  name: "Flash Sale",
                );
              }));
            },
          ),
          SizedBox(
            height: 274 * h,
            child: StreamBuilder<ProductListModel>(
              stream: homeSaleBloc.fetchFlashSale,
              builder: (context, snapshot) {
                if (snapshot.hasData || homeModel != null) {
                  if (snapshot.hasData) {
                    homeModel = snapshot.data;
                  }
                  return ListView.builder(
                    padding: EdgeInsets.only(
                      left: 16 * w,
                      top: 12 * h,
                      bottom: 24 * h,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: homeModel!.results.length,
                    itemBuilder: (context, index) {
                      return ProductWidget(
                        height: 238 * h,
                        width: 141 * w,
                        margin: EdgeInsets.only(right: 16 * w),
                        data: homeModel!.results[index],
                      );
                    },
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
            child: StreamBuilder<ProductListModel>(
              stream: homeSaleBloc.fetchMegaSale,
              builder: (context, snapshot) {
                if (snapshot.hasData || homeModel != null) {
                  if (snapshot.hasData) {
                    homeModel = snapshot.data;
                  }
                  return ListView.builder(
                    padding: EdgeInsets.only(
                      left: 16 * w,
                      top: 12 * h,
                      bottom: 24 * h,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: homeModel!.results.length,
                    itemBuilder: (context, index) {
                      return ProductWidget(
                        height: 238 * h,
                        width: 141 * w,
                        margin: EdgeInsets.only(right: 16 * w),
                        data: homeModel!.results[index],
                      );
                    },
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
              },
            ),
          ),
          StreamBuilder<RecommendModel>(
            stream: recommendBloc.fetchRecommend,
            builder: (context, snapshot) {
              if (snapshot.hasData || recommendModel != null) {
                if (snapshot.hasData) {
                  recommendModel = snapshot.data;
                }
                List<RecommendResult> recommendResult = recommendModel!.results;
                return Column(
                  children: [
                    SizedBox(
                      height: 16 * h,
                    ),
                    CarouselSlider(
                      items: recommendResult.map((recommendResult) {
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
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 12 * h,
                            bottom: 24 * h,
                          ),
                          height: 191 * h,
                          child: ListView.builder(
                            padding: EdgeInsets.only(left: 24 * w),
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, position) {
                              return Container(
                                height: 206 * h,
                                width: MediaQuery.of(context).size.width * w -
                                    60 * w,
                                margin: EdgeInsets.only(
                                  right: 16 * w,
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.white,
                                  borderRadius: BorderRadius.circular(8 * o),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
          StreamBuilder<ProductListModel>(
            stream: homeSaleBloc.fetchHomeSale,
            builder: (context, snapshot) {
              if (snapshot.hasData || homeModel != null) {
                if (snapshot.hasData) {
                  homeModel = snapshot.data;
                }
                List<ProductListResult> homeResult = homeModel!.results;
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
                                    data: homeResult[index * gridCount],
                                  ),
                                ),
                                SizedBox(width: 16 * w),
                                Expanded(
                                  child: index * gridCount + 1 >=
                                          homeResult.length
                                      ? Container()
                                      : ProductWidget(
                                          star: true,
                                          height: 282 * h,
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  48 * w) /
                                              2,
                                          data:
                                              homeResult[index * gridCount + 1],
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
                          (homeResult.length + gridCount - 1) ~/ gridCount,
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
}
