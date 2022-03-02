import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lafyu/src/model/category_model.dart';

import '../../app_theme/app_theme.dart';
import '../../bloc/category_bloc.dart';
import '../../utils/utils.dart';
import '../../widget/search_widget.dart';

class MoreCategoryScreen extends StatefulWidget {
  const MoreCategoryScreen({Key? key}) : super(key: key);

  @override
  _MoreCategoryScreenState createState() => _MoreCategoryScreenState();
}

class _MoreCategoryScreenState extends State<MoreCategoryScreen>{
List<String> data = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "11111111",
  "11112332",
  "12",
  "13",
];
int gridCount = 2;
CategoryModel ? categoryModel;

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
    int gridCount = 2;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.white,
        title: const SearchWidget(),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 16 * w,
              top: 16 * h,
              bottom: 12 * h,
            ),
            child: Text(
              "Man Fashion",
              style: TextStyle(
                color: AppTheme.dark63,
                fontFamily: AppTheme.fontFamilyPoppins,
                fontWeight: FontWeight.bold,
                fontSize: 14 * o,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),


          Expanded(
            child: StreamBuilder<CategoryModel>(
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
                            children: [
                              SizedBox(width: 16 * w),
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 8 * h),
                                      height: 70 * o,
                                      width: 70 * o,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: AppTheme.border,
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              categoryResult[index * gridCount]
                                                  .image,
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator
                                                  .adaptive(),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom: 16 * h,
                                      ),
                                      width: 70,
                                      child: Text(
                                        categoryResult[index * gridCount].name,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: AppTheme.greyB1,
                                          fontSize: 10 * o,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 21 * w),
                              Expanded(
                                child: index * gridCount + 1 >=
                                        categoryResult.length
                                    ? Container()
                                    : Column(
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.only(bottom: 8 * h),
                                            height: 70 * o,
                                            width: 70 * o,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.white,
                                              border: Border.all(
                                                color: AppTheme.border,
                                                width: 1,
                                              ),
                                            ),
                                            child: Center(
                                              child: CachedNetworkImage(
                                                imageUrl: categoryResult[
                                                        index * gridCount + 1]
                                                    .image,
                                                placeholder: (context, url) =>
                                                    const CircularProgressIndicator
                                                        .adaptive(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              bottom: 16 * h,
                                            ),
                                            width: 70,
                                            child: Text(
                                              categoryResult[
                                                      index * gridCount + 1]
                                                  .name,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: AppTheme.greyB1,
                                                fontSize: 10 * o,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                              SizedBox(width: 21 * w),
                              Expanded(
                                child: index * gridCount + 2 >=
                                        categoryResult.length
                                    ? Container()
                                    : Column(
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.only(bottom: 8 * h),
                                            height: 70 * o,
                                            width: 70 * o,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.white,
                                              border: Border.all(
                                                color: AppTheme.border,
                                                width: 1,
                                              ),
                                            ),
                                            child: Center(
                                              child: CachedNetworkImage(
                                                imageUrl: categoryResult[
                                                        index * gridCount + 2]
                                                    .image,
                                                placeholder: (context, url) =>
                                                    const CircularProgressIndicator
                                                        .adaptive(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              bottom: 16 * h,
                                            ),
                                            width: 70,
                                            child: Text(
                                              categoryResult[
                                                      index * gridCount + 2]
                                                  .name,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: AppTheme.greyB1,
                                                fontSize: 10 * o,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                              SizedBox(width: 21 * w),
                              Expanded(
                                child: index * gridCount + 3 >=
                                        categoryResult.length
                                    ? Container()
                                    : Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              bottom: 8 * h,
                                            ),
                                            height: 70 * o,
                                            width: 70 * o,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.white,
                                              border: Border.all(
                                                color: AppTheme.border,
                                                width: 1,
                                              ),
                                            ),
                                            child: Center(
                                              child: CachedNetworkImage(
                                                imageUrl: categoryResult[
                                                        index * gridCount + 3]
                                                    .image,
                                                placeholder: (context, url) =>
                                                    const CircularProgressIndicator
                                                        .adaptive(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              bottom: 16 * h,
                                            ),
                                            width: 70,
                                            child: Text(
                                              categoryResult[
                                                      index * gridCount + 3]
                                                  .name,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: AppTheme.greyB1,
                                                fontSize: 10 * o,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                              SizedBox(width: 16 * h),
                            ],
                          ),
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
          ),
          Container(
            margin: EdgeInsets.only(
              left: 16 * w,
              bottom: 12 * h,
            ),
            child: Text(
              "Man Fashion",
              style: TextStyle(
                color: AppTheme.dark63,
                fontFamily: AppTheme.fontFamilyPoppins,
                fontWeight: FontWeight.bold,
                fontSize: 14 * o,
                fontStyle: FontStyle.normal,
              ),
            ),
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
                          children: [
                            SizedBox(width: 16 * w),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 8 * h),
                                    height: 70 * o,
                                    width: 70 * o,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: AppTheme.border,
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            categoryResult[index * gridCount]
                                                .image,
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator
                                                .adaptive(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      bottom: 16 * h,
                                    ),
                                    width: 70,
                                    child: Text(
                                      categoryResult[index * gridCount].name,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: AppTheme.greyB1,
                                        fontSize: 10 * o,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 21 * w),
                            Expanded(
                              child: index * gridCount + 1 >=
                                      categoryResult.length
                                  ? Container()
                                  : Column(
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.only(bottom: 8 * h),
                                          height: 70 * o,
                                          width: 70 * o,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: AppTheme.border,
                                              width: 1,
                                            ),
                                          ),
                                          child: Center(
                                            child: CachedNetworkImage(
                                              imageUrl: categoryResult[
                                                      index * gridCount + 1]
                                                  .image,
                                              placeholder: (context, url) =>
                                                  const CircularProgressIndicator
                                                      .adaptive(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            bottom: 16 * h,
                                          ),
                                          width: 70,
                                          child: Text(
                                            categoryResult[
                                                    index * gridCount + 1]
                                                .name,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: AppTheme.greyB1,
                                              fontSize: 10 * o,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                            SizedBox(width: 21 * w),
                            Expanded(
                              child: index * gridCount + 2 >=
                                      categoryResult.length
                                  ? Container()
                                  : Column(
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.only(bottom: 8 * h),
                                          height: 70 * o,
                                          width: 70 * o,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: AppTheme.border,
                                              width: 1,
                                            ),
                                          ),
                                          child: Center(
                                            child: CachedNetworkImage(
                                              imageUrl: categoryResult[
                                                      index * gridCount + 2]
                                                  .image,
                                              placeholder: (context, url) =>
                                                  const CircularProgressIndicator
                                                      .adaptive(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            bottom: 16 * h,
                                          ),
                                          width: 70,
                                          child: Text(
                                            categoryResult[
                                                    index * gridCount + 2]
                                                .name,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: AppTheme.greyB1,
                                              fontSize: 10 * o,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                            SizedBox(width: 21 * w),
                            Expanded(
                              child: index * gridCount + 3 >=
                                      categoryResult.length
                                  ? Container()
                                  : Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                            bottom: 8 * h,
                                          ),
                                          height: 70 * o,
                                          width: 70 * o,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: AppTheme.border,
                                              width: 1,
                                            ),
                                          ),
                                          child: Center(
                                            child: CachedNetworkImage(
                                              imageUrl: categoryResult[
                                                      index * gridCount + 3]
                                                  .image,
                                              placeholder: (context, url) =>
                                                  const CircularProgressIndicator
                                                      .adaptive(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            bottom: 16 * h,
                                          ),
                                          width: 70,
                                          child: Text(
                                            categoryResult[
                                                    index * gridCount + 3]
                                                .name,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: AppTheme.greyB1,
                                              fontSize: 10 * o,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                            SizedBox(width: 16 * h),
                          ],
                        ),
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










          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 16*w),
                      Expanded(
                        child: Container(
                          height: 120*o,
                          width: 120*o,
                          color: Colors.red,
                          child: Center(
                            child: Text((data[index * gridCount]).toString()),
                          ),
                        ),
                      ),
                      SizedBox(width: 4*w),
                      Expanded(
                        child: index * gridCount + 1 >= data.length
                            ? Container()
                            : Container(
                          height: 120,
                          width: 120,
                          color: Colors.red,
                          child: Center(
                            child: Text(
                                (data[index * gridCount + 1]).toString()),
                          ),
                        ),
                      ),

                      SizedBox(width: 16*w),
                    ],
                  ),
                  SizedBox(height: 12*h),
                ],
              );
            },
            itemCount: (data.length + gridCount - 1) ~/ gridCount,
          )










        ],
      ),
    );
  }
}
