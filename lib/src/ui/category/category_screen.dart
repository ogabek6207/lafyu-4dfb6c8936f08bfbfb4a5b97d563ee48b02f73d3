import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/bloc/category_bloc.dart';
import 'package:lafyu/src/model/api/category_model.dart';
import 'package:lafyu/src/widget/app_widget.dart';
import 'package:lafyu/src/widget/category/category_type_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/utils.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CategoryModel? categoryModel;

  @override
  void initState() {
    categoryBloc.getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        automaticallyImplyLeading: false,
        elevation: 1,
        title: const AppBarWidget(
          title: 'Category',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<CategoryModel>(
              stream: categoryBloc.fetchCategory,
              builder: (context, snapshot) {
                if (snapshot.hasData || categoryModel != null) {
                  if (snapshot.hasData) {
                    categoryModel = snapshot.data;
                  }
                  List<CategoryResult> result = categoryModel!.results;
                  return ListView.builder(
                    itemCount: result.length,
                    itemBuilder: (context, index) => CategoryTypeWidget(
                      name: result[index].name,
                      icon: result[index].image,
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
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 12 * h,
                              bottom: 24 * h,
                            ),
                            height: 56 * h,
                            child: ListView.builder(
                              padding: EdgeInsets.only(left: 24 * w),
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, position) {
                                return Container(
                                  height: 56 * h,
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
          ),
        ],
      ),
    );
  }
}
