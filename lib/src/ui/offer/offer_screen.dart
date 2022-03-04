import 'package:flutter/material.dart';
import '../../model/super_flash_sale_model.dart';
import '../../utils/utils.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({
    Key? key,
  }) : super(key: key);

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
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
    return Scaffold(
      appBar: AppBar(),
      body: Column(),
    );
  }
}
