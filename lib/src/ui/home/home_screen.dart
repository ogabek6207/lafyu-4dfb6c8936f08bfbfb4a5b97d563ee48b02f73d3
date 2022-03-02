import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/bloc/category_bloc.dart';
import 'package:lafyu/src/bloc/home_bloc.dart';
import 'package:lafyu/src/bloc/super_flash_sale_bloc.dart';
import 'package:lafyu/src/bloc/recommend_bloc.dart';
import 'package:lafyu/src/model/category_model.dart';
import 'package:lafyu/src/model/home_model.dart';
import 'package:lafyu/src/model/recommend_model.dart';
import 'package:lafyu/src/model/super_flash_sale_model.dart';
import 'package:lafyu/src/ui/favourite/favourite_screen.dart';
import 'package:lafyu/src/ui/home/product_screen.dart';
import 'package:lafyu/src/widget/category_widget.dart';
import 'package:lafyu/src/widget/item_horizantal_widget.dart';
import 'package:lafyu/src/widget/section_bar_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/utils.dart';
import '../../widget/banner_widget.dart';
import '../../widget/searchWidget.dart';
import '../offer/offer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SuperFlashSaleModel? superFlashSaleModel;
  RecommendModel? recommendModel;
  HomeModel? homeModel;
  CategoryModel? categoryModel;
  int notfication = 8;
  int _current = 2;
  int activateIndex = 0;

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
    int gridCount = 2;

    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        elevation: 0,
        title: SearchWidgetHome(onTap: () {  },),
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
                List<SuperFlashSaleResult> saleResult =
                    superFlashSaleModel!.results;
                return Column(
                  children: [
                    SizedBox(
                      height: 16 * h,
                    ),
                    CarouselSlider(
                      items: saleResult.map((saleResult) {
                        return Builder(builder: (BuildContext context) {
                          return BannerWidget(
                              image:
                              saleResult.image,
                              name: saleResult.name,
                              clock: saleResult.endDate,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return OfferScreen();
                                    },
                                  ),
                                );
                              });
                        });
                      }).toList(),
                      options: CarouselOptions(
                        height: 209 * h,
                        autoPlay: true,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            activateIndex = index;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16 * h,
                    ),
                    AnimatedSmoothIndicator(
                      effect: WormEffect(
                        dotHeight: 8 * o,
                        dotWidth: 8 * o,
                        type: WormType.thin,
                        // strokeWidth: 5,
                      ),
                      activeIndex: activateIndex,
                      count: saleResult.length,
                    ),
                  ],
                );
              }
              return Container();
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
                Row(
                  children: [
                    Expanded(
                        child: SectionBarWidget(
                            leftTitle: "Category",
                            rightTitle: "More Category",
                            onTap: () {})),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 16 * h,
                  ),
                  height: 110 * h,
                  child: StreamBuilder<CategoryModel>(
                    stream: categoryBloc.fetchCategory,
                    builder: (context, snapshot) {
                      if (snapshot.hasData || categoryModel != null) {
                        if (snapshot.hasData) {
                          categoryModel = snapshot.data;
                        }
                        List<CategoryResult> categoryResult =
                            categoryModel!.results;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryResult.length,
                          itemBuilder: (context, index) => CategoryWidget(image: categoryResult[index].image, name: categoryResult[index].name, onTap: (){}),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 24 * h),
            child: Row(
              children: [
                SizedBox(
                  width: 16 * w,
                ),
                Expanded(
                  child: Text(
                    "Flash Sale",
                    style: TextStyle(
                      color: AppTheme.dark63,
                      fontSize: 14 * o,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.5 * o,
                    ),
                  ),
                ),
                Text(
                  "See More",
                  style: TextStyle(
                    color: AppTheme.blueFF,
                    fontSize: 14 * o,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    height: 1.5,
                    letterSpacing: 0.5 * o,
                  ),
                ),
                SizedBox(
                  width: 16 * w,
                ),
              ],
            ),
          ),
          Container(
            height: 260 * h,
            margin: EdgeInsets.only(
              top: 12 * h,
            ),
            child: StreamBuilder<HomeModel>(
              stream: homeSaleBloc.fetchFlashSale,
              builder: (context, snapshot) {
                if (snapshot.hasData || homeModel != null) {
                  if (snapshot.hasData) {
                    homeModel = snapshot.data;
                  }

                  List<HomeResult> product = homeModel!.results;
                  double discountPercent;
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: product.length,
                      itemBuilder: (context, index) {
                        discountPercent = 100 -
                            ((product[index].price * 100) /
                                product[index].discountPrice);
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProductScreen(
                                    id: product[index].id,
                                  );
                                },
                              ),
                            );
                          },
                          child: ItemHorizontalWidget(
                            data: product[index],
                            image: product[index].images.image,
                            discountPercent: discountPercent,
                          ),
                        );
                      });
                }
                return Container();
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 24 * h),
            child: Row(
              children: [
                SizedBox(
                  width: 16 * w,
                ),
                Expanded(
                  child: Text(
                    "Mega Sale",
                    style: TextStyle(
                      color: AppTheme.dark63,
                      fontSize: 14 * o,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.5 * o,
                    ),
                  ),
                ),
                Text(
                  "See More",
                  style: TextStyle(
                    color: AppTheme.blueFF,
                    fontSize: 14 * o,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    height: 1.5,
                    letterSpacing: 0.5 * o,
                  ),
                ),
                SizedBox(
                  width: 16 * w,
                ),
              ],
            ),
          ),
          Container(
            height: 260 * h,
            margin: EdgeInsets.only(
              top: 12 * h,
            ),
            child: StreamBuilder<HomeModel>(
              stream: homeSaleBloc.fetchMegaSale,
              builder: (context, snapshot) {
                if (snapshot.hasData || homeModel != null) {
                  if (snapshot.hasData) {
                    homeModel = snapshot.data;
                  }

                  List<HomeResult> product = homeModel!.results;
                  double discountPercent;
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: product.length,
                      itemBuilder: (context, index) {
                        discountPercent = 100 -
                            ((product[index].price * 100) /
                                product[index].discountPrice);
                        print(discountPercent);
                        return ItemHorizontalWidget(
                          data: product[index],
                          image: product[index].images.image,
                          discountPercent: discountPercent,
                        );
                      });
                }

                return Container();
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
                    CarouselSlider.builder(
                      itemBuilder: (context, index, realIndex) {
                        return Stack(
                          children: [
                            Container(
                              height: 206 * h,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(
                                top: 8 * h,
                                left: 16,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5 * o),
                                  border: Border.all(
                                      color: AppTheme.border, width: 1)),
                              child: ClipRect(
                                child: CachedNetworkImage(
                                  imageUrl: recommendResult[index].image,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator
                                          .adaptive(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            Container(
                              height: 206,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(
                                left: 16 * w,
                                right: 16 * w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5 * o),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 72 * h,
                                    width: 209 * w,
                                    margin: EdgeInsets.only(
                                      top: 42 * h,
                                      left: 24 * w,
                                    ),
                                    child: Text(
                                      recommendResult[index].name,
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: AppTheme.white,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24 * o,
                                        fontFamily: AppTheme.fontFamilyPoppins,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 42 * h,
                                    margin: EdgeInsets.only(
                                      left: 24 * w,
                                      top: 16 * h,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          recommendResult[index].title,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: AppTheme.white,
                                            letterSpacing: 0.5,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12 * o,
                                            fontFamily:
                                                AppTheme.fontFamilyPoppins,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      options: CarouselOptions(
                        height: 206 * h,
                        initialPage: 0,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        autoPlay: true,
                        autoPlayInterval: const Duration(
                          seconds: 10,
                        ),
                        onPageChanged: (index, reason) {
                          setState(() {
                            activateIndex = index;
                          });
                          // print(index);
                        },
                      ),
                      itemCount: recommendResult.length,
                    ),
                    SizedBox(
                      height: 16 * h,
                    ),
                    AnimatedSmoothIndicator(
                      effect: WormEffect(
                        dotHeight: 8 * o,
                        dotWidth: 8 * o,
                        type: WormType.thin,
                        // strokeWidth: 5,
                      ),
                      activeIndex: activateIndex,
                      count: recommendResult.length,
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
          StreamBuilder<HomeModel>(
            stream: homeSaleBloc.fetchHomeSale,
            builder: (context, snapshot) {
              if (snapshot.hasData || homeModel != null) {
                if (snapshot.hasData) {
                  homeModel = snapshot.data;
                }
                List<HomeResult> homeResult = homeModel!.results;
                double discountPercent;
                return Column(
                  children: [
                    SizedBox(
                      height: 16 * h,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        discountPercent = 100 -
                            ((homeResult[index].price * 100) /
                                homeResult[index].discountPrice);
                        print(discountPercent);
                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 165 * w,
                                    margin: EdgeInsets.only(
                                      left: 16 * o,
                                      top: 16 * o,
                                    ),
                                    height: 290 * h,
                                    padding: EdgeInsets.all(
                                      16 * o,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppTheme.border,
                                        width: 1,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(5 * o),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 133 * o,
                                          width: 133 * o,
                                          margin: EdgeInsets.only(
                                            bottom: 8 * h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppTheme.white,
                                            borderRadius:
                                                BorderRadius.circular(5 * o),
                                            border: Border.all(
                                              color: AppTheme.border,
                                              width: 1,
                                            ),
                                          ),
                                          child: ClipRect(
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  homeResult[index * gridCount]
                                                      .images
                                                      .image,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  const CircularProgressIndicator
                                                      .adaptive(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 133 * w,
                                          child: Text(
                                            homeResult[index * gridCount].name,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12 * o,
                                              color: AppTheme.dark63,
                                              fontFamily:
                                                  AppTheme.fontFamilyPoppins,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 4 * h),
                                          width: 68 * w,
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                "assets/icons/star.svg",
                                              ),
                                              SvgPicture.asset(
                                                homeResult[index * gridCount]
                                                            .start >
                                                        1
                                                    ? "assets/icons/star.svg"
                                                    : "assets/icons/star1.svg",
                                              ),
                                              SvgPicture.asset(
                                                homeResult[index * gridCount]
                                                            .start >
                                                        2
                                                    ? "assets/icons/star.svg"
                                                    : "assets/icons/star1.svg",
                                              ),
                                              SvgPicture.asset(
                                                homeResult[index * gridCount]
                                                            .start >
                                                        3
                                                    ? "assets/icons/star.svg"
                                                    : "assets/icons/star1.svg",
                                              ),
                                              SvgPicture.asset(
                                                homeResult[index * gridCount]
                                                            .start >
                                                        4
                                                    ? "assets/icons/star.svg"
                                                    : "assets/icons/star1.svg",
                                              )
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              child: Text(
                                                "\$" +
                                                    homeResult[
                                                            index * gridCount]
                                                        .price
                                                        .toString(),
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12 * o,
                                                  color: AppTheme.blueFF,
                                                  fontFamily: AppTheme
                                                      .fontFamilyPoppins,
                                                ),
                                              ),
                                              margin: EdgeInsets.only(
                                                bottom: 4 * h,
                                                top: 16 * h,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "\$" +
                                                  homeResult[index * gridCount]
                                                      .discountPrice
                                                      .toString(),
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 10 * o,
                                                color: AppTheme.greyB1,
                                                fontFamily:
                                                    AppTheme.fontFamilyPoppins,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8 * w,
                                            ),
                                            Text(
                                              discountPercent
                                                      .toStringAsFixed(0) +
                                                  "% Off",
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 10 * o,
                                                color: AppTheme.red,
                                                fontFamily:
                                                    AppTheme.fontFamilyPoppins,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: index * gridCount + 1 >=
                                          homeResult.length
                                      ? Container()
                                      : Container(
                                          margin: EdgeInsets.only(
                                            left: 16 * w,
                                            top: 16 * h,
                                            right: 16 * w,
                                          ),
                                          height: 285 * h,
                                          padding: EdgeInsets.all(
                                            16 * o,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppTheme.border,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5 * o),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 133 * o,
                                                width: 133 * o,
                                                margin: EdgeInsets.only(
                                                  bottom: 8 * h,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppTheme.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5 * o),
                                                  border: Border.all(
                                                    color: AppTheme.border,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: ClipRect(
                                                  child: CachedNetworkImage(
                                                    imageUrl: homeResult[
                                                            index * gridCount +
                                                                1]
                                                        .images
                                                        .image,
                                                    fit: BoxFit.cover,
                                                    placeholder: (context,
                                                            url) =>
                                                        const CircularProgressIndicator
                                                            .adaptive(),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        const Icon(Icons.error),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Nike Air Max 270 React ENG",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12 * o,
                                                  color: AppTheme.dark63,
                                                  fontFamily: AppTheme
                                                      .fontFamilyPoppins,
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 4 * h),
                                                width: 68,
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      "assets/icons/star.svg",
                                                    ),
                                                    SvgPicture.asset(
                                                      homeResult[index * gridCount +
                                                                      1]
                                                                  .start >
                                                              1
                                                          ? "assets/icons/star.svg"
                                                          : "assets/icons/star1.svg",
                                                    ),
                                                    SvgPicture.asset(
                                                      homeResult[index * gridCount +
                                                                      1]
                                                                  .start >
                                                              2
                                                          ? "assets/icons/star.svg"
                                                          : "assets/icons/star1.svg",
                                                    ),
                                                    SvgPicture.asset(
                                                      homeResult[index * gridCount +
                                                                      1]
                                                                  .start >
                                                              3
                                                          ? "assets/icons/star.svg"
                                                          : "assets/icons/star1.svg",
                                                    ),
                                                    SvgPicture.asset(
                                                      homeResult[index * gridCount +
                                                                      1]
                                                                  .start >
                                                              4
                                                          ? "assets/icons/star.svg"
                                                          : "assets/icons/star1.svg",
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      "\$299,43",
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 12 * o,
                                                        color: AppTheme.blueFF,
                                                        fontFamily: AppTheme
                                                            .fontFamilyPoppins,
                                                      ),
                                                    ),
                                                    margin: EdgeInsets.only(
                                                      bottom: 4 * h,
                                                      top: 16 * h,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    homeResult[
                                                            index * gridCount +
                                                                1]
                                                        .name,
                                                    textAlign: TextAlign.start,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 10 * o,
                                                      color: AppTheme.greyB1,
                                                      fontFamily: AppTheme
                                                          .fontFamilyPoppins,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 8 * w,
                                                  ),
                                                  Text(
                                                    "24% Off",
                                                    textAlign: TextAlign.start,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 10 * o,
                                                      color: AppTheme.red,
                                                      fontFamily: AppTheme
                                                          .fontFamilyPoppins,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12 * h),
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
