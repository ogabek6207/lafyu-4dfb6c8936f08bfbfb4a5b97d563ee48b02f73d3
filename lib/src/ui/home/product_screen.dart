import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../bloc/super_flash_sale_bloc.dart';
import '../../model/super_flash_sale_model.dart';
import '../../utils/utils.dart';
import '../../widget/banner_widget.dart';

class SuperFlashSaleScreen extends StatefulWidget {
  final int id;

  const SuperFlashSaleScreen({Key? key, required this.id}) : super(key: key);

  @override
  _SuperFlashSaleScreenState createState() => _SuperFlashSaleScreenState();
}

class _SuperFlashSaleScreenState extends State<SuperFlashSaleScreen> {
  SuperFlashSaleModel? superFlashSaleModel;

  int activateIndex = 0;

  @override
  void initState() {
   superFlashSaleBloc.getSuperFlashSale();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
                            image: saleResult.image,
                            name: saleResult.name,
                            clock: saleResult.endDate,
                            onTap: () {},
                          );
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

                    // StreamBuilder<HomeModel>(
                    //   stream: homeSaleBloc.fetchHomeSale,
                    //   builder: (context, snapshot) {
                    //     if (snapshot.hasData || homeModel != null) {
                    //       if (snapshot.hasData) {
                    //         homeModel = snapshot.data;
                    //       }
                    //       List<HomeResult> homeResult = homeModel!.results;
                    //       double discountPercent;
                    //       return Column(
                    //         children: [
                    //           SizedBox(
                    //             height: 16 * h,
                    //           ),
                    //           ListView.builder(
                    //             shrinkWrap: true,
                    //             physics: const NeverScrollableScrollPhysics(),
                    //             itemBuilder: (context, index) {
                    //               discountPercent = 100 -
                    //                   ((homeResult[index].price * 100) /
                    //                       homeResult[index].discountPrice);
                    //               print(discountPercent);
                    //               return Column(
                    //                 children: [
                    //                   Row(
                    //                     crossAxisAlignment: CrossAxisAlignment.center,
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       Expanded(
                    //                         child: GestureDetector(
                    //                           onTap: () {
                    //                             Navigator.push(
                    //                               context,
                    //                               MaterialPageRoute(builder: (context) {
                    //                                 return DetailScreen(
                    //                                     id: homeResult[index * gridCount]
                    //                                         .id);
                    //                               }),
                    //                             );
                    //                           },
                    //                           child: Container(
                    //                             width: 165 * w,
                    //                             margin: EdgeInsets.only(
                    //                               left: 16 * o,
                    //                               top: 16 * o,
                    //                             ),
                    //                             height: 290 * h,
                    //                             padding: EdgeInsets.all(
                    //                               16 * o,
                    //                             ),
                    //                             decoration: BoxDecoration(
                    //                               border: Border.all(
                    //                                 color: AppTheme.border,
                    //                                 width: 1,
                    //                               ),
                    //                               borderRadius:
                    //                               BorderRadius.circular(5 * o),
                    //                             ),
                    //                             child: Column(
                    //                               crossAxisAlignment:
                    //                               CrossAxisAlignment.start,
                    //                               children: [
                    //                                 Container(
                    //                                   height: 133 * o,
                    //                                   width: 133 * o,
                    //                                   margin: EdgeInsets.only(
                    //                                     bottom: 8 * h,
                    //                                   ),
                    //                                   decoration: BoxDecoration(
                    //                                     color: AppTheme.white,
                    //                                     borderRadius:
                    //                                     BorderRadius.circular(5 * o),
                    //                                     border: Border.all(
                    //                                       color: AppTheme.border,
                    //                                       width: 1,
                    //                                     ),
                    //                                   ),
                    //                                   child: ClipRect(
                    //                                     child: CachedNetworkImage(
                    //                                       imageUrl: homeResult[
                    //                                       index * gridCount]
                    //                                           .images
                    //                                           .image,
                    //                                       fit: BoxFit.cover,
                    //                                       placeholder: (context, url) =>
                    //                                       const CircularProgressIndicator
                    //                                           .adaptive(),
                    //                                       errorWidget:
                    //                                           (context, url, error) =>
                    //                                       const Icon(Icons.error),
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                                 SizedBox(
                    //                                   width: 133 * w,
                    //                                   child: Text(
                    //                                     homeResult[index * gridCount]
                    //                                         .name,
                    //                                     maxLines: 2,
                    //                                     overflow: TextOverflow.ellipsis,
                    //                                     style: TextStyle(
                    //                                       fontWeight: FontWeight.bold,
                    //                                       fontStyle: FontStyle.normal,
                    //                                       fontSize: 12 * o,
                    //                                       color: AppTheme.dark63,
                    //                                       fontFamily:
                    //                                       AppTheme.fontFamilyPoppins,
                    //                                     ),
                    //                                   ),
                    //                                 ),
                    //                                 Container(
                    //                                   margin: EdgeInsets.only(top: 4 * h),
                    //                                   width: 68 * w,
                    //                                   child: Row(
                    //                                     children: [
                    //                                       SvgPicture.asset(
                    //                                         "assets/icons/star.svg",
                    //                                       ),
                    //                                       SvgPicture.asset(
                    //                                         homeResult[index * gridCount]
                    //                                             .start >
                    //                                             1
                    //                                             ? "assets/icons/star.svg"
                    //                                             : "assets/icons/star1.svg",
                    //                                       ),
                    //                                       SvgPicture.asset(
                    //                                         homeResult[index * gridCount]
                    //                                             .start >
                    //                                             2
                    //                                             ? "assets/icons/star.svg"
                    //                                             : "assets/icons/star1.svg",
                    //                                       ),
                    //                                       SvgPicture.asset(
                    //                                         homeResult[index * gridCount]
                    //                                             .start >
                    //                                             3
                    //                                             ? "assets/icons/star.svg"
                    //                                             : "assets/icons/star1.svg",
                    //                                       ),
                    //                                       SvgPicture.asset(
                    //                                         homeResult[index * gridCount]
                    //                                             .start >
                    //                                             4
                    //                                             ? "assets/icons/star.svg"
                    //                                             : "assets/icons/star1.svg",
                    //                                       )
                    //                                     ],
                    //                                   ),
                    //                                 ),
                    //                                 Row(
                    //                                   children: [
                    //                                     Container(
                    //                                       child: Text(
                    //                                         "\$" +
                    //                                             homeResult[
                    //                                             index * gridCount]
                    //                                                 .price
                    //                                                 .toString(),
                    //                                         textAlign: TextAlign.start,
                    //                                         overflow:
                    //                                         TextOverflow.ellipsis,
                    //                                         style: TextStyle(
                    //                                           fontWeight: FontWeight.bold,
                    //                                           fontStyle: FontStyle.normal,
                    //                                           fontSize: 12 * o,
                    //                                           color: AppTheme.blueFF,
                    //                                           fontFamily: AppTheme
                    //                                               .fontFamilyPoppins,
                    //                                         ),
                    //                                       ),
                    //                                       margin: EdgeInsets.only(
                    //                                         bottom: 4 * h,
                    //                                         top: 16 * h,
                    //                                       ),
                    //                                     ),
                    //                                   ],
                    //                                 ),
                    //                                 Row(
                    //                                   children: [
                    //                                     Text(
                    //                                       "\$" +
                    //                                           homeResult[
                    //                                           index * gridCount]
                    //                                               .discountPrice
                    //                                               .toString(),
                    //                                       textAlign: TextAlign.start,
                    //                                       overflow: TextOverflow.ellipsis,
                    //                                       style: TextStyle(
                    //                                         decoration: TextDecoration
                    //                                             .lineThrough,
                    //                                         fontWeight: FontWeight.normal,
                    //                                         fontStyle: FontStyle.normal,
                    //                                         fontSize: 10 * o,
                    //                                         color: AppTheme.greyB1,
                    //                                         fontFamily: AppTheme
                    //                                             .fontFamilyPoppins,
                    //                                       ),
                    //                                     ),
                    //                                     SizedBox(
                    //                                       width: 8 * w,
                    //                                     ),
                    //                                     Text(
                    //                                       discountPercent
                    //                                           .toInt()
                    //                                           .toStringAsFixed(0) +
                    //                                           "% Off",
                    //                                       textAlign: TextAlign.start,
                    //                                       overflow: TextOverflow.ellipsis,
                    //                                       style: TextStyle(
                    //                                         fontWeight: FontWeight.bold,
                    //                                         fontStyle: FontStyle.normal,
                    //                                         fontSize: 10 * o,
                    //                                         color: AppTheme.red,
                    //                                         fontFamily: AppTheme
                    //                                             .fontFamilyPoppins,
                    //                                       ),
                    //                                     ),
                    //                                   ],
                    //                                 ),
                    //                               ],
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                       Expanded(
                    //                         child: index * gridCount + 1 >=
                    //                             homeResult.length
                    //                             ? Container()
                    //                             : Container(
                    //                           margin: EdgeInsets.only(
                    //                             left: 16 * w,
                    //                             top: 16 * h,
                    //                             right: 16 * w,
                    //                           ),
                    //                           height: 290 * h,
                    //                           padding: EdgeInsets.all(
                    //                             16 * o,
                    //                           ),
                    //                           decoration: BoxDecoration(
                    //                             border: Border.all(
                    //                               color: AppTheme.border,
                    //                               width: 1,
                    //                             ),
                    //                             borderRadius:
                    //                             BorderRadius.circular(5 * o),
                    //                           ),
                    //                           child: Column(
                    //                             crossAxisAlignment:
                    //                             CrossAxisAlignment.start,
                    //                             children: [
                    //                               Container(
                    //                                 height: 133 * o,
                    //                                 width: 133 * o,
                    //                                 margin: EdgeInsets.only(
                    //                                   bottom: 8 * h,
                    //                                 ),
                    //                                 decoration: BoxDecoration(
                    //                                   color: AppTheme.white,
                    //                                   borderRadius:
                    //                                   BorderRadius.circular(
                    //                                       5 * o),
                    //                                   border: Border.all(
                    //                                     color: AppTheme.border,
                    //                                     width: 1,
                    //                                   ),
                    //                                 ),
                    //                                 child: ClipRect(
                    //                                   child: CachedNetworkImage(
                    //                                     imageUrl: homeResult[
                    //                                     index * gridCount +
                    //                                         1]
                    //                                         .images
                    //                                         .image,
                    //                                     fit: BoxFit.cover,
                    //                                     placeholder: (context,
                    //                                         url) =>
                    //                                     const CircularProgressIndicator
                    //                                         .adaptive(),
                    //                                     errorWidget: (context, url,
                    //                                         error) =>
                    //                                     const Icon(Icons.error),
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                               Text(
                    //                                 "Nike Air Max 270 React ENG",
                    //                                 maxLines: 2,
                    //                                 overflow: TextOverflow.ellipsis,
                    //                                 style: TextStyle(
                    //                                   fontWeight: FontWeight.bold,
                    //                                   fontStyle: FontStyle.normal,
                    //                                   fontSize: 12 * o,
                    //                                   color: AppTheme.dark63,
                    //                                   fontFamily: AppTheme
                    //                                       .fontFamilyPoppins,
                    //                                 ),
                    //                               ),
                    //                               Container(
                    //                                 margin:
                    //                                 EdgeInsets.only(top: 4 * h),
                    //                                 width: 68 * w,
                    //                                 child: Row(
                    //                                   children: [
                    //                                     SvgPicture.asset(
                    //                                       "assets/icons/star.svg",
                    //                                     ),
                    //                                     SvgPicture.asset(
                    //                                       homeResult[index * gridCount +
                    //                                           1]
                    //                                           .start >
                    //                                           1
                    //                                           ? "assets/icons/star.svg"
                    //                                           : "assets/icons/star1.svg",
                    //                                     ),
                    //                                     SvgPicture.asset(
                    //                                       homeResult[index * gridCount +
                    //                                           1]
                    //                                           .start >
                    //                                           2
                    //                                           ? "assets/icons/star.svg"
                    //                                           : "assets/icons/star1.svg",
                    //                                     ),
                    //                                     SvgPicture.asset(
                    //                                       homeResult[index * gridCount +
                    //                                           1]
                    //                                           .start >
                    //                                           3
                    //                                           ? "assets/icons/star.svg"
                    //                                           : "assets/icons/star1.svg",
                    //                                     ),
                    //                                     SvgPicture.asset(
                    //                                       homeResult[index * gridCount +
                    //                                           1]
                    //                                           .start >
                    //                                           4
                    //                                           ? "assets/icons/star.svg"
                    //                                           : "assets/icons/star1.svg",
                    //                                     )
                    //                                   ],
                    //                                 ),
                    //                               ),
                    //                               Row(
                    //                                 children: [
                    //                                   Container(
                    //                                     child: Text(
                    //                                       "\$" +
                    //                                           homeResult[index *
                    //                                               gridCount +
                    //                                               1]
                    //                                               .price
                    //                                               .toInt()
                    //                                               .toString(),
                    //                                       textAlign:
                    //                                       TextAlign.start,
                    //                                       overflow:
                    //                                       TextOverflow.ellipsis,
                    //                                       style: TextStyle(
                    //                                         fontWeight:
                    //                                         FontWeight.bold,
                    //                                         fontStyle:
                    //                                         FontStyle.normal,
                    //                                         fontSize: 12 * o,
                    //                                         color: AppTheme.blueFF,
                    //                                         fontFamily: AppTheme
                    //                                             .fontFamilyPoppins,
                    //                                       ),
                    //                                     ),
                    //                                     margin: EdgeInsets.only(
                    //                                       bottom: 4 * h,
                    //                                       top: 16 * h,
                    //                                     ),
                    //                                   ),
                    //                                 ],
                    //                               ),
                    //                               Row(
                    //                                 children: [
                    //                                   Text(
                    //                                     "\$" +
                    //                                         homeResult[index *
                    //                                             gridCount +
                    //                                             1]
                    //                                             .discountPrice
                    //                                             .toInt()
                    //                                             .toString(),
                    //                                     textAlign: TextAlign.start,
                    //                                     overflow:
                    //                                     TextOverflow.ellipsis,
                    //                                     style: TextStyle(
                    //                                       fontWeight:
                    //                                       FontWeight.normal,
                    //                                       fontStyle:
                    //                                       FontStyle.normal,
                    //                                       fontSize: 10 * o,
                    //                                       color: AppTheme.greyB1,
                    //                                       fontFamily: AppTheme
                    //                                           .fontFamilyPoppins,
                    //                                     ),
                    //                                   ),
                    //                                   SizedBox(
                    //                                     width: 8 * w,
                    //                                   ),
                    //                                   Text(
                    //                                     discountPercent
                    //                                         .toInt()
                    //                                         .toString() +
                    //                                         "% Off",
                    //                                     textAlign: TextAlign.start,
                    //                                     overflow:
                    //                                     TextOverflow.ellipsis,
                    //                                     style: TextStyle(
                    //                                       fontWeight:
                    //                                       FontWeight.bold,
                    //                                       fontStyle:
                    //                                       FontStyle.normal,
                    //                                       fontSize: 10 * o,
                    //                                       color: AppTheme.red,
                    //                                       fontFamily: AppTheme
                    //                                           .fontFamilyPoppins,
                    //                                     ),
                    //                                   ),
                    //                                 ],
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                   SizedBox(height: 12 * h),
                    //                 ],
                    //               );
                    //             },
                    //             itemCount:
                    //             (homeResult.length + gridCount - 1) ~/ gridCount,
                    //           ),
                    //         ],
                    //       );
                    //     }
                    //     return Container();
                    //   },
                    // ),
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
