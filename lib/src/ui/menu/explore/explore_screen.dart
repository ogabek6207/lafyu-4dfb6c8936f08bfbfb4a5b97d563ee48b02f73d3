import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/bloc/category_bloc.dart';
import 'package:lafyu/src/model/api/category_model.dart';
import 'package:lafyu/src/ui/favourite/favourite_screen.dart';
import 'package:lafyu/src/ui/notification/notification_type_screen.dart';
import 'package:lafyu/src/utils/utils.dart';
import 'package:lafyu/src/widget/category/category_list_widget.dart';
import 'package:lafyu/src/widget/searchWidget.dart';
import 'package:lafyu/src/widget/section_bar_widget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final int _notfication = 8;

  @override
  void initState() {
    categoryBloc.getCategoryType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
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
                MaterialPageRoute(
                  builder: (context) {
                    return const NotificationTypeScreen();
                  },
                ),
              );
            },
            child: _notfication >= 1
                ? Badge(
                    badgeColor: AppTheme.blueFF,
                    badgeContent: Text(
                      _notfication.toString(),
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
      body: StreamBuilder<CategoryType>(
        stream: categoryBloc.fetchCategoryType,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CategoryResult> man = snapshot.data!.man;
            List<CategoryResult> woman = snapshot.data!.woman;
            List<CategoryResult> kids = snapshot.data!.kids;
            return ListView(
              children: [
                SizedBox(height: 16*h,),
              SectionBarWidget(leftTitle: "Man", rightTitle: "", onTap: (){}),
                SizedBox(height: 16*h,),
                CategoryListWidget(data: man),
                SizedBox(height: 16*h,),
                SectionBarWidget(leftTitle: "Woman", rightTitle: "", onTap: (){}),
                SizedBox(height: 16*h,),
                CategoryListWidget(data:     woman),
                SizedBox(height: 16*h,),
                SectionBarWidget(leftTitle: "Kids", rightTitle: "", onTap: (){}),
                SizedBox(height: 16*h,),
                CategoryListWidget(data: kids),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
