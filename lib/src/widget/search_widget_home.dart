import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/model/event/event_bottom_model.dart';
import 'package:lafyu/src/ui/favourite/favourite_screen.dart';
import 'package:lafyu/src/utils/rx_bus.dart';
import '../utils/utils.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return SizedBox(
      height: 46 * h,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                right: 16 * w,
              ),
              padding: EdgeInsets.only(left: 16 * w),
              height: 46 * h,
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.circular(5 * o),
                border: Border.all(
                  color: AppTheme.border,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/search.svg",
                  ),
                  SizedBox(
                    width: 8 * w,
                  ),
                  Center(
                    child: Text(
                      "Search Product",
                      style: TextStyle(
                        color: AppTheme.greyB1,
                        fontWeight: FontWeight.normal,
                        fontSize: 12 * o,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
            child: SvgPicture.asset(
              "assets/icons/like.svg",
            ),
          ),
          SizedBox(
            width: 16 * w,
          ),
          GestureDetector(
            onTap: () {
              RxBus.post(EventBottomModel(2), tag: "baqay_bottom_view");
            },
            child: SvgPicture.asset(
              "assets/icons/bell.svg",
            ),
          )
        ],
      ),
    );
  }
}
