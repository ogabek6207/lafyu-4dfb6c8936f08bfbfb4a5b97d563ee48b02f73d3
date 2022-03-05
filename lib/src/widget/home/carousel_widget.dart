import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:lafyu/src/model/super_flash_sale_model.dart';
import 'package:lafyu/src/ui/menu/home/sale/super_sale_screen.dart';
import 'package:lafyu/src/utils/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../banner_widget.dart';

class CarouselWidget extends StatefulWidget {
  final List<SuperFlashSaleResult> data;

  const CarouselWidget({Key? key, required this.data}) : super(key: key);

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int activateIndex = 0;

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Column(
      children: [
        SizedBox(
          height: 16 * h,
        ),
        CarouselSlider(
          items: widget.data.map((saleResult) {
            return Builder(
              builder: (BuildContext context) {
                return BannerWidget(
                  image: saleResult.image,
                  name: saleResult.name,
                  clock: saleResult.endDate,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SuperSaleScreen(id: saleResult.id);
                        },
                      ),
                    );
                  },
                );
              },
            );
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
          count: widget.data.length,
        ),
      ],
    );
  }
}
