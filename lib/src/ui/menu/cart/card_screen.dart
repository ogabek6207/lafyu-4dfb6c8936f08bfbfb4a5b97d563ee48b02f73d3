import 'package:flutter/material.dart';
import 'package:lafyu/src/model/api/product_list_model.dart';
import 'package:lafyu/src/widget/product_list/product_widget.dart';

import '../../../bloc/home_bloc.dart';
import '../../../utils/utils.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  ProductListModel? productListModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
