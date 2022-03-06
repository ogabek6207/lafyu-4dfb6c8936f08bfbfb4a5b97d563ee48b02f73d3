import 'package:flutter/material.dart';
import 'package:lafyu/src/bloc/super_flash_sale_bloc.dart';
import 'package:lafyu/src/model/super_flash_sale_model.dart';
import 'package:lafyu/src/utils/utils.dart';
import 'package:lafyu/src/widget/banner_widget.dart';

import '../../../app_theme/app_theme.dart';

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
    superFlashSaleBloc.getSuperFlashSale();
    super.initState();
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
        centerTitle: false,
        backgroundColor: AppTheme.white,
        title: Text(
          "Offer",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: AppTheme.dark63,
            fontWeight: FontWeight.bold,
            fontSize: 16 * o,
            fontStyle: FontStyle.normal,
            fontFamily: AppTheme.fontFamilyPoppins,
            letterSpacing: 0.005,
            height: 1.5,
          ),
        ),
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
                List<SuperFlashSaleResult> result =
                    superFlashSaleModel!.results;
                return Expanded(
                  child: ListView.builder(
                    itemCount: result.length,
                    itemBuilder: (context, index) => Column(

                      children: [
                        SizedBox(height: 16*h,),
                        BannerWidget(
                          onTap: () {},
                          name: result[index].name,
                          clock: result[index].endDate,
                          image: result[index].image,
                        ),
                      ],
                    ),
                  ),
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
