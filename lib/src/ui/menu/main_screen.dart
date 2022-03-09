import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/model/event/event_bottom_model.dart';
import 'package:lafyu/src/ui/menu/cart/card_screen.dart';

import 'package:lafyu/src/ui/menu/explore/explore_screen.dart';
import 'package:lafyu/src/ui/menu/home/home_screen.dart';
import 'package:lafyu/src/ui/menu/offer/offer_screen.dart';
import 'package:lafyu/src/ui/menu/profile/account_screen.dart';

import 'package:lafyu/src/utils/rx_bus.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    registerBus();
    super.initState();
  }

  @override
  void dispose() {
    RxBus.destroy(tag: "baqay_bottom_view");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomeScreen(
          pageChanged: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        const ExploreScreen(),
        const CardScreen(),
        const OfferScreen(),
        const ProfileScreen(),
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (_index) {
          setState(() {
            _selectedIndex = _index;
          });
        },
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: const TextStyle(
          color: Colors.red,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        selectedItemColor: AppTheme.blueFF,
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? SvgPicture.asset("assets/menu/home_blue.svg")
                : SvgPicture.asset("assets/menu/home.svg"),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? SvgPicture.asset(
                    "assets/menu/search_blue.svg",
                  )
                : SvgPicture.asset(
                    "assets/menu/search.svg",
                  ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? SvgPicture.asset(
                    "assets/menu/cart_blue.svg",
                  )
                : SvgPicture.asset(
                    "assets/menu/cart.svg",
                  ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? SvgPicture.asset(
                    "assets/menu/offer_blue.svg",
                  )
                : SvgPicture.asset(
                    "assets/menu/offer.svg",
                  ),
            label: "Offer",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 4
                ? SvgPicture.asset(
                    "assets/menu/user_blue.svg",
                  )
                : SvgPicture.asset(
                    "assets/menu/user.svg",
                  ),
            label: "profile",
          ),
        ],
      ),
    );
  }

  void registerBus() {
    RxBus.register<EventBottomModel>(tag: "baqay_bottom_view").listen(
      (event) {
        setState(() {
          _selectedIndex = event.position;
          Timer(const Duration(seconds: 1), () {
            RxBus.post(EventBottomModel(24251), tag: "baqay_category");
          });
        });
      },
    );
  }
}
