import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/bloc/category_bloc.dart';
import 'package:lafyu/src/model/api/category_model.dart';
import 'package:lafyu/src/model/event/event_bottom_model.dart';
import 'package:lafyu/src/ui/favourite/favourite_screen.dart';
import 'package:lafyu/src/ui/notification/notification_type_screen.dart';
import 'package:lafyu/src/utils/rx_bus.dart';
import 'package:lafyu/src/utils/utils.dart';
import 'package:lafyu/src/widget/category_widget.dart';
import 'package:lafyu/src/widget/searchWidget.dart';
import 'package:lafyu/src/widget/section_bar_widget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _controller = TextEditingController();
  CategoryModel? categoryModel;
  int notfication = 8;
  int gridCount = 4;

  @override
  void initState() {
    categoryBloc.getCategory();
    _registerBus();
    super.initState();
  }

  @override
  void dispose() {
    RxBus.destroy(tag: "baqay_category");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        elevation: 1,
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
                      child: SvgPicture.asset("assets/icons/bell.svg"),
                    ),
                  )
                : Center(
                    child: SvgPicture.asset("assets/icons/bell.svg"),
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
        padding: EdgeInsets.only(top: 16 * h),
        children: [
          SectionBarWidget(
              leftTitle: "Man Fashion", rightTitle: "", onTap: () {}),
          SizedBox(
            height: 12 * h,
          ),
          StreamBuilder<CategoryModel>(
            stream: categoryBloc.fetchCategory,
            builder: (context, snapshot) {
              if (snapshot.hasData || categoryModel != null) {
                if (snapshot.hasData) {
                  categoryModel = snapshot.data;
                }

                List<CategoryResult> categoryResult = categoryModel!.results;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 16 * w),
                            Expanded(
                              child: CategoryWidget(
                                height: 282 * h,
                                width: (MediaQuery.of(context).size.width -
                                        48 * w) /
                                    2,
                                onTap: () {},
                                name: categoryResult[index * gridCount].name,
                                margin: EdgeInsets.only(left: 0 * w),
                                image: categoryResult[index * gridCount].image,
                              ),
                            ),
                            SizedBox(width: 16 * w),
                            Expanded(
                              child: index * gridCount + 1 >=
                                      categoryResult.length
                                  ? Container()
                                  : CategoryWidget(
                                      height: 282 * h,
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  48 * w) /
                                              2,
                                      onTap: () {},
                                      name:
                                          categoryResult[index * gridCount + 1]
                                              .name,
                                      margin: EdgeInsets.only(left: 0 * w),
                                      image:
                                          categoryResult[index * gridCount + 1]
                                              .image,
                                    ),
                            ),
                            SizedBox(width: 16 * w),
                            Expanded(
                              child: index * gridCount + 2 >=
                                      categoryResult.length
                                  ? Container()
                                  : CategoryWidget(
                                      height: 282 * h,
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  48 * w) /
                                              2,
                                      onTap: () {},
                                      name:
                                          categoryResult[index * gridCount + 2]
                                              .name,
                                      margin: EdgeInsets.only(left: 0 * w),
                                      image:
                                          categoryResult[index * gridCount + 2]
                                              .image,
                                    ),
                            ),
                            SizedBox(width: 16 * w),
                            Expanded(
                              child: index * gridCount + 3 >=
                                      categoryResult.length
                                  ? Container()
                                  : CategoryWidget(
                                      height: 282 * h,
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  48 * w) /
                                              2,
                                      onTap: () {},
                                      name:
                                          categoryResult[index * gridCount + 3]
                                              .name,
                                      margin: EdgeInsets.only(left: 0 * w),
                                      image:
                                          categoryResult[index * gridCount + 3]
                                              .image,
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
                      (categoryResult.length + gridCount - 1) ~/ gridCount,
                );
              }
              return Container();
            },
          ),
          SizedBox(
            height: 8 * h,
          ),
          SectionBarWidget(
              leftTitle: "Women Fashion", rightTitle: "", onTap: () {}),
          SizedBox(
            height: 12 * h,
          ),
          StreamBuilder<CategoryModel>(
            stream: categoryBloc.fetchCategory,
            builder: (context, snapshot) {
              if (snapshot.hasData || categoryModel != null) {
                if (snapshot.hasData) {
                  categoryModel = snapshot.data;
                }
                List<CategoryResult> categoryResult = categoryModel!.results;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 16 * w),
                            Expanded(
                              child: CategoryWidget(
                                height: 282 * h,
                                width: (MediaQuery.of(context).size.width -
                                        48 * w) /
                                    2,
                                onTap: () {},
                                name: categoryResult[index * gridCount].name,
                                margin: EdgeInsets.only(left: 0 * w),
                                image: categoryResult[index * gridCount].image,
                              ),
                            ),
                            SizedBox(width: 16 * w),
                            Expanded(
                              child: index * gridCount + 1 >=
                                      categoryResult.length
                                  ? Container()
                                  : CategoryWidget(
                                      height: 282 * h,
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  48 * w) /
                                              2,
                                      onTap: () {},
                                      name:
                                          categoryResult[index * gridCount + 1]
                                              .name,
                                      margin: EdgeInsets.only(left: 0 * w),
                                      image:
                                          categoryResult[index * gridCount + 1]
                                              .image,
                                    ),
                            ),
                            SizedBox(width: 16 * w),
                            Expanded(
                              child: index * gridCount + 2 >=
                                      categoryResult.length
                                  ? Container()
                                  : CategoryWidget(
                                      height: 282 * h,
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  48 * w) /
                                              2,
                                      onTap: () {},
                                      name:
                                          categoryResult[index * gridCount + 2]
                                              .name,
                                      margin: EdgeInsets.only(left: 0 * w),
                                      image:
                                          categoryResult[index * gridCount + 2]
                                              .image,
                                    ),
                            ),
                            SizedBox(width: 16 * w),
                            Expanded(
                              child: index * gridCount + 3 >=
                                      categoryResult.length
                                  ? Container()
                                  : CategoryWidget(
                                      height: 282 * h,
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  48 * w) /
                                              2,
                                      onTap: () {},
                                      name:
                                          categoryResult[index * gridCount + 3]
                                              .name,
                                      margin: EdgeInsets.only(left: 0 * w),
                                      image:
                                          categoryResult[index * gridCount + 3]
                                              .image,
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
                      (categoryResult.length + gridCount - 1) ~/ gridCount,
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  void _registerBus() {
    RxBus.register<EventBottomModel>(tag: "baqay_category").listen(
      (event) {
        print(event.position);
        setState(() {
          _controller.text = event.position.toString();
        });
      },
    );
  }
}
