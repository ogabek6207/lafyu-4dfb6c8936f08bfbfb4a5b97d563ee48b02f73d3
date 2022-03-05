import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/bloc/product_bloc.dart';
import '../../model/api/product_list_model.dart';
import '../../model/api/product_model.dart';
import '../../utils/utils.dart';
import '../../widget/button_widget.dart';
import '../../widget/product_widget.dart';
import '../../widget/section_bar_widget.dart';
import '../review/review_screen.dart';

class DetailScreen extends StatefulWidget {
  final int id;

  const DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  ProductModel? productModel;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    productBloc.getProductDescription(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = Utils.windowWidth(context);
    double h = Utils.windowHeight(context);
    return StreamBuilder<ProductModel>(
        stream: productBloc.fetchProduct,
        builder: (context, snapshot) {
          ProductModel productModel = snapshot.data!;
          return Scaffold(
            backgroundColor: AppTheme.white,
            appBar: AppBar(
              backgroundColor: AppTheme.white,
              automaticallyImplyLeading: false,
              elevation: 0,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: SvgPicture.asset('assets/icons/arrow_left.svg'),
                ),
              ),
              title: Text(
                productModel.category,
                style: TextStyle(fontSize: 16 * h, color: Colors.black),
              ),
              actions: [
                SvgPicture.asset('assets/icons/search.svg'),
                SizedBox(
                  width: 25 * w,
                ),
                SvgPicture.asset('assets/icons/more.svg'),
                SizedBox(
                  width: 27 * w,
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      StreamBuilder<ProductModel>(
                          stream: productBloc.fetchProduct,
                          builder: (context, snapshot) {
                            List<ImageResults> imageResult =
                                productModel.images;
                            return Column(
                              children: [
                                CarouselSlider(
                                  items: imageResult.map((imageResult) {
                                    return Builder(
                                        builder: (BuildContext context) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 238 * h,
                                        child: CachedNetworkImage(
                                          imageUrl: imageResult.image,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator
                                                  .adaptive(),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      );
                                    });
                                  }).toList(),
                                  options: CarouselOptions(
                                    viewportFraction: 0.90,
                                    height: 238 * h,
                                    autoPlay: true,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _current = index;
                                      });
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                      imageResult.asMap().entries.map((entry) {
                                    return GestureDetector(
                                      onTap: () =>
                                          _controller.animateToPage(entry.key),
                                      child: Container(
                                        width: 10.0,
                                        height: 10.0,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 4.0),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                (Theme.of(context).brightness ==
                                                            Brightness.dark
                                                        ? AppTheme.greyB1
                                                        : AppTheme.blueFF)
                                                    .withOpacity(
                                                        _current == entry.key
                                                            ? 1
                                                            : 0.3)),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            );
                          }),
                      SizedBox(
                        height: 8 * h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 275 * w,
                            child: Text(
                              productModel.name,
                              style: TextStyle(
                                  fontSize: 20 * h,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/like.svg',
                            width: 24 * w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10 * h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 16 * w,
                          ),
                          SvgPicture.asset(
                            "assets/icons/star.svg",
                          ),
                          SvgPicture.asset(
                            productModel.reviewAvg > 1
                                ? "assets/icons/star.svg"
                                : "assets/icons/star1.svg",
                          ),
                          SvgPicture.asset(
                            productModel.reviewAvg > 2
                                ? "assets/icons/star.svg"
                                : "assets/icons/star1.svg",
                          ),
                          SvgPicture.asset(
                            productModel.reviewAvg > 3
                                ? "assets/icons/star.svg"
                                : "assets/icons/star1.svg",
                          ),
                          SvgPicture.asset(
                            productModel.reviewAvg > 4
                                ? "assets/icons/star.svg"
                                : "assets/icons/star1.svg",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16 * h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16 * w),
                        child: Text(
                          '\$' + productModel.price.toInt().toString(),
                          style: TextStyle(
                              fontSize: 20 * h,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.blueFF),
                        ),
                      ),
                      SizedBox(
                        height: 24 * h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16 * w),
                        child: Text(
                          'O\'lchamni tanlang',
                          style: TextStyle(
                            fontSize: 14 * h,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12 * h,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          height: 48 * h,
                          child: StreamBuilder<ProductModel>(
                              stream: productBloc.fetchProduct,
                              builder: (context, snapshot) {
                                List<Size> result = productModel.size;
                                return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: result.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(left: 16 * w),
                                        width: 48 * h,
                                        height: 48 * h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            border: Border.all(
                                                color: AppTheme.greyB1
                                                    .withOpacity(0.3))),
                                        child: Center(
                                          child: Text(
                                              result[index].size.toString()),
                                        ),
                                      );
                                    });
                              }),
                        ),
                      ),
                      SizedBox(
                        height: 24 * h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16 * w),
                        child: Text(
                          'Rangini tanlang',
                          style: TextStyle(
                            fontSize: 14 * h,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12 * h,
                      ),
                      SizedBox(
                        height: 48 * h,
                        child: StreamBuilder<ProductModel>(
                            stream: productBloc.fetchProduct,
                            builder: (context, snapshot) {
                              List<ColorResult> result = productModel.color;
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: result.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(left: 16 * w),
                                      width: 48 * h,
                                      height: 48 * h,
                                      decoration: BoxDecoration(
                                        color: AppTheme.purple,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Center(
                                        child: Container(
                                          width: 16 * h,
                                          height: 16 * h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: AppTheme.white),
                                        ),
                                      ),
                                    );
                                  });
                            }),
                      ),
                      SizedBox(
                        height: 12 * h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16 * w),
                        child: Text(
                          'Ta\'rif',
                          style: TextStyle(
                            fontSize: 14 * h,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16 * w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Shown:",
                              style: TextStyle(
                                  fontSize: 12 * h,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                                width: 171 * w,
                                child: Text(
                                  'Laser Blue/Anthracite/Watermelon/White',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 12 * h, color: AppTheme.greyB1),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16 * h,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16 * w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Style:",
                              style: TextStyle(
                                  fontSize: 12 * h,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'CD0113-400',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 12 * h, color: AppTheme.greyB1),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16 * w,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16 * w),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Nike Air Max 270 React ENG beqiyos qulaylik va ajoyib vizual tajriba uchun toʻliq uzunlikdagi React koʻpikli oʻrta taglikni 270 Max Air birligi bilan birlashtiradi.',
                          style: TextStyle(
                              fontSize: 12 * h, color: AppTheme.greyB1),
                        ),
                      ),
                      SizedBox(
                        height: 24 * h,
                      ),
                      SectionBarWidget(
                          leftTitle: 'Mahsulotni ko\'rib chiqish',
                          rightTitle: 'Batafsil',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const ReviewScreen();
                              }),
                            );
                          }),
                      Row(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 16 * w,
                              ),
                              SvgPicture.asset(
                                "assets/icons/star.svg",
                              ),
                              SvgPicture.asset(
                                productModel.reviewAvg > 1
                                    ? "assets/icons/star.svg"
                                    : "assets/icons/star1.svg",
                              ),
                              SvgPicture.asset(
                                productModel.reviewAvg > 2
                                    ? "assets/icons/star.svg"
                                    : "assets/icons/star1.svg",
                              ),
                              SvgPicture.asset(
                                productModel.reviewAvg > 3
                                    ? "assets/icons/star.svg"
                                    : "assets/icons/star1.svg",
                              ),
                              SvgPicture.asset(
                                productModel.reviewAvg > 4
                                    ? "assets/icons/star.svg"
                                    : "assets/icons/star1.svg",
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 8 * w,
                          ),
                          Text(
                            productModel.reviewAvg.toString(),
                            style: TextStyle(
                                fontSize: 10 * h,
                                color: AppTheme.greyB1,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '  (${productModel.reviewCount} Ko‘rib chiqish)',
                            style: TextStyle(
                                fontSize: 10 * h, color: AppTheme.greyB1),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16 * w,
                      ),
                      StreamBuilder<ProductModel>(
                          stream: productBloc.fetchProduct,
                          builder: (context, snapshot) {
                            Review result = productModel.review;
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 16 * w,
                                    ),
                                    SizedBox(
                                      width: 48 * h,
                                      height: 48 * h,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: result.images.image,
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator
                                                  .adaptive(),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16 * w,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            result.user.firstName +
                                                " " +
                                                result.user.lastName,
                                            style: TextStyle(
                                              fontSize: 14 * h,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4 * h,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/icons/star.svg'),
                                              SvgPicture.asset(
                                                  'assets/icons/star.svg'),
                                              SvgPicture.asset(
                                                  'assets/icons/star.svg'),
                                              SvgPicture.asset(
                                                  'assets/icons/star.svg'),
                                              SvgPicture.asset(
                                                  'assets/icons/star.svg'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16 * h,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 16 * w),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        result.text,
                                        style: TextStyle(
                                            fontSize: 12 * h,
                                            fontWeight: FontWeight.w500,
                                            color: AppTheme.greyB1),
                                      ),
                                      SizedBox(
                                        height: 23 * h,
                                      ),
                                      Text(
                                        result.date.year.toString() +
                                            "-yil " +
                                            result.date.day.toString() +
                                            "-" +
                                            Utils.getMonth(result.date.month),
                                        style: TextStyle(
                                          fontSize: 10 * h,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16 * h,
                                ),
                              ],
                            );
                          }),
                      SizedBox(
                        height: 20 * h,
                      ),
                      SizedBox(
                        height: 23 * h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16 * w),
                        child: Text(
                          'Sizga yoqishi mumkin',
                          style: TextStyle(
                            fontSize: 14 * h,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12 * h,
                      ),
                      SizedBox(
                        height: 238 * h,
                        child: StreamBuilder<ProductModel>(
                            stream: productBloc.fetchProduct,
                            builder: (context, snapshot) {
                              List<ProductListResult> result =
                                  productModel.products;
                              return ListView.builder(
                                itemCount: result.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => ProductWidget(
                                  image: result[index].images.image,
                                  name: result[index].name,
                                  price: result[index].price,
                                  oldPrice: result[index].discountPrice,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const DetailScreen(
                                            id: 1,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                ButtonWidget(
                  margin: EdgeInsets.only(
                      left: 16 * w,
                      right: 16 * w,
                      bottom: Platform.isIOS ? 32 : 24),
                  width: MediaQuery.of(context).size.width,
                  text: 'Savatga qo\'shish',
                  color: AppTheme.blueFF,
                  height: 57 * h,
                  onTap: () {},
                ),
              ],
            ),
          );
        });
  }
}
