import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../bloc/super_flash_sale_bloc.dart';
import '../../model/super_flash_sale_category.dart';
import '../../model/super_flash_sale_model.dart';
import '../../utils/utils.dart';
import '../home/detail_screen.dart';

class SuperFlashSaleScreen extends StatefulWidget {
  final int productId;

  const SuperFlashSaleScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  _SuperFlashSaleScreenState createState() => _SuperFlashSaleScreenState();
}

class _SuperFlashSaleScreenState extends State<SuperFlashSaleScreen> {
  SuperFlashSaleModel? superFlashSaleModel;
  SuperFlashSaleCategoryModel? superFlashSaleCategoryModel;

  int activateIndex = 0;

  @override
  void initState() {
    superFlashSaleBloc.getSuperFlashSale();
    superFlashSaleBloc.getSuperFlashSaleCategory(widget.productId);
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
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              top: 70 * h,
              left: 16 * w,
              right: 16 * w,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 12 * w,
                    ),
                    height: 24 * o,
                    width: 24 * o,
                    child: SvgPicture.asset(
                      "assets/icons/arrow_left.svg",
                      height: 24 * o,
                      width: 24 * o,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Super Flash Sale",
                    style: TextStyle(
                      color: AppTheme.dark63,
                      fontFamily: AppTheme.fontFamilyPoppins,
                      fontSize: 16 * o,
                      height: 1.5,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SvgPicture.asset("assets/menu/search.svg"),
              ],
            ),
          ),
          Container(
            height: 1 * h,
            margin: EdgeInsets.only(top: 28 * h),
            color: AppTheme.border,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
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
                          CarouselSlider.builder(
                            itemBuilder: (context, index, realIndex) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return SuperFlashSaleScreen(
                                          productId: saleResult[index].id);
                                    }),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 206 * h,
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(
                                        right: 16 * w,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5 * o),
                                      ),
                                      child: ClipRect(
                                        child: CachedNetworkImage(
                                          imageUrl: saleResult[index].image,
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
                                      height: 206 * h,
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(
                                        left: 16 * w,
                                        right: 16 * w,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5 * o),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 70 * h,
                                            width: 209 * w,
                                            margin: EdgeInsets.only(
                                              top: 32 * h,
                                              left: 24 * w,
                                            ),
                                            child: Text(
                                              "${saleResult[index].name} ${saleResult[index].percent}% Off",
                                              textAlign: TextAlign.start,
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: AppTheme.white,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24 * o,
                                                fontFamily:
                                                    AppTheme.fontFamilyPoppins,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 42 * h,
                                            width: 150 * w,
                                            margin: EdgeInsets.only(
                                              // left: 24 * w,
                                              top: 28 * h,
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 41 * h,
                                                  width: 42 * w,
                                                  decoration: BoxDecoration(
                                                    color: AppTheme.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5 * o),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      saleResult[index]
                                                          .endDate
                                                          .hour
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: AppTheme.dark63,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16 * w,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 21 * h,
                                                  width: 4 * w,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 4 * w),
                                                  child: Center(
                                                    child: SvgPicture.asset(
                                                      "assets/icons/minute.svg",
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 41 * h,
                                                  width: 42 * w,
                                                  decoration: BoxDecoration(
                                                    color: AppTheme.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5 * o),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      saleResult[index]
                                                          .endDate
                                                          .minute
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: AppTheme.dark63,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16 * w,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    height: 21 * h,
                                                    width: 4 * w,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 4 * w),
                                                    child: Center(
                                                      child: SvgPicture.asset(
                                                        "assets/icons/minute.svg",
                                                      ),
                                                    )),
                                                Container(
                                                  height: 41 * h,
                                                  width: 42 * w,
                                                  decoration: BoxDecoration(
                                                    color: AppTheme.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5 * o),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      saleResult[index]
                                                          .endDate
                                                          .second
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: AppTheme.dark63,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16 * w,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
                            itemCount: saleResult.length,
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
                StreamBuilder<SuperFlashSaleCategoryModel>(
                  stream: superFlashSaleBloc.fetchSuperFlashSaleCategory,
                  builder: (context, snapshot) {
                    if (snapshot.hasData || superFlashSaleCategoryModel != null) {
                      if (snapshot.hasData) {
                        superFlashSaleCategoryModel = snapshot.data;
                      }
                      List<SuperFlashSaleProduct> productResult = superFlashSaleCategoryModel!.product;
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
                                  ((productResult[index].price * 100) /
                                      productResult[index].discountPrice);
                              print(discountPercent);
                              return Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) {
                                                return DetailScreen(
                                                    id: productResult[index * gridCount]
                                                        .id);
                                              }),
                                            );
                                          },
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
                                                      imageUrl: productResult[
                                                      index * gridCount]
                                                          .images[index].image,
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
                                                    productResult[index * gridCount]
                                                        .name,
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
                                                        productResult[index * gridCount]
                                                            .start >
                                                            1
                                                            ? "assets/icons/star.svg"
                                                            : "assets/icons/star1.svg",
                                                      ),
                                                      SvgPicture.asset(
                                                        productResult[index * gridCount]
                                                            .start >
                                                            2
                                                            ? "assets/icons/star.svg"
                                                            : "assets/icons/star1.svg",
                                                      ),
                                                      SvgPicture.asset(
                                                        productResult[index * gridCount]
                                                            .start >
                                                            3
                                                            ? "assets/icons/star.svg"
                                                            : "assets/icons/star1.svg",
                                                      ),
                                                      SvgPicture.asset(
                                                        productResult[index * gridCount]
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
                                                            productResult[
                                                            index * gridCount]
                                                                .price
                                                                .toString(),
                                                        textAlign: TextAlign.start,
                                                        overflow:
                                                        TextOverflow.ellipsis,
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
                                                          productResult[
                                                          index * gridCount]
                                                              .discountPrice
                                                              .toString(),
                                                      textAlign: TextAlign.start,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        decoration: TextDecoration
                                                            .lineThrough,
                                                        fontWeight: FontWeight.normal,
                                                        fontStyle: FontStyle.normal,
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
                                                      discountPercent
                                                          .toInt()
                                                          .toStringAsFixed(0) +
                                                          "% Off",
                                                      textAlign: TextAlign.start,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontStyle: FontStyle.normal,
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
                                      ),
                                      Expanded(
                                        child: index * gridCount + 1 >=
                                            productResult.length
                                            ? Container()
                                            : Container(
                                          margin: EdgeInsets.only(
                                            left: 16 * w,
                                            top: 16 * h,
                                            right: 16 * w,
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
                                                  BorderRadius.circular(
                                                      5 * o),
                                                  border: Border.all(
                                                    color: AppTheme.border,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: ClipRect(
                                                  child: CachedNetworkImage(
                                                    imageUrl: productResult[
                                                    index * gridCount +
                                                        1]
                                                        .images
                                                        [index].image,
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
                                                width: 68 * w,
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      "assets/icons/star.svg",
                                                    ),
                                                    SvgPicture.asset(
                                                      productResult[index * gridCount +
                                                          1]
                                                          .start >
                                                          1
                                                          ? "assets/icons/star.svg"
                                                          : "assets/icons/star1.svg",
                                                    ),
                                                    SvgPicture.asset(
                                                      productResult[index * gridCount +
                                                          1]
                                                          .start >
                                                          2
                                                          ? "assets/icons/star.svg"
                                                          : "assets/icons/star1.svg",
                                                    ),
                                                    SvgPicture.asset(
                                                      productResult[index * gridCount +
                                                          1]
                                                          .start >
                                                          3
                                                          ? "assets/icons/star.svg"
                                                          : "assets/icons/star1.svg",
                                                    ),
                                                    SvgPicture.asset(
                                                      productResult[index * gridCount +
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
                                                      "\$" +
                                                          productResult[index *
                                                              gridCount +
                                                              1]
                                                              .price
                                                              .toInt()
                                                              .toString(),
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
                                                    "\$" +
                                                        productResult[index *
                                                            gridCount +
                                                            1]
                                                            .discountPrice
                                                            .toInt()
                                                            .toString(),
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
                                                    discountPercent
                                                        .toInt()
                                                        .toString() +
                                                        "% Off",
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
                            (productResult.length + gridCount - 1) ~/ gridCount,
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
