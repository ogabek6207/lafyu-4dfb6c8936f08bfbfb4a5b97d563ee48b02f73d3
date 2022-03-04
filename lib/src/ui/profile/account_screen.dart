import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/ui/profile/my_profile/my_profile_screen.dart';
import 'package:lafyu/src/ui/profile/order/order_screen.dart';
import 'package:lafyu/src/widget/account_widget.dart';
import '../../utils/utils.dart';
import 'address/address_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: false,
        backgroundColor: AppTheme.white,
        title: Text(
          "Account",
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
      backgroundColor: AppTheme.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 16 * w,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyProfileScreen()),
                    );
                  },
                  child: const AccountWidget(
                    icon: 'assets/icons/user_blue.svg',
                    title: 'Profile',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderScreen(),
                      ),
                    );
                  },
                  child: const AccountWidget(
                    icon: 'assets/icons/bag.svg',
                    title: 'Order',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddressScreen(),
                      ),
                    );
                  },
                  child: const AccountWidget(
                    title: 'Address',
                    icon: 'assets/icons/location.svg',
                  ),
                ),
                const AccountWidget(
                  icon: "assets/icons/payment.svg",
                  title: "Payment",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
