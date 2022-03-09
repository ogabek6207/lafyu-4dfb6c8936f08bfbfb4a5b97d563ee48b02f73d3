import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/widget/app_widget.dart';
import 'package:lafyu/src/widget/payment/payment_widget.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({Key? key}) : super(key: key);

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.white,
        elevation: 1,
        title: const AppBarWidget(
          title: 'Credit Card And Debit',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) => PaymentWidget(color: AppTheme.blueFF,),
            ),
          ),
        ],
      ),
    );
  }
}
