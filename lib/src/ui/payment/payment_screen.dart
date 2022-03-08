import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/widget/app_widget.dart';
import 'package:lafyu/src/widget/category/category_type_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 1,
        title: const AppBarWidget(
          title: 'Payment',
        ),
      ),
      body: Column(
        children:  [
       Material(

                  child: InkWell(
                      onTap: (){},

                      child: CategoryTypeWidget(icon: "icon", name: "name"))),
        ],
      ),
    );
  }
}
