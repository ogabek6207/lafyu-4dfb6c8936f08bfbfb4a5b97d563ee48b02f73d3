import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../bloc/super_flash_sale_bloc.dart';
import '../../../../model/super_flash_sale_model.dart';
import '../../../../utils/utils.dart';
import '../../../../widget/banner_widget.dart';


class SuperSaleScreen extends StatefulWidget {
  final int id;

  const SuperSaleScreen({Key? key, required this.id}) : super(key: key);

  @override
  _SuperSaleScreenState createState() => _SuperSaleScreenState();
}

class _SuperSaleScreenState extends State<SuperSaleScreen> {
  SuperFlashSaleModel? superFlashSaleModel;

  int activateIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppTheme.white,

          ),
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
    );
  }
}
