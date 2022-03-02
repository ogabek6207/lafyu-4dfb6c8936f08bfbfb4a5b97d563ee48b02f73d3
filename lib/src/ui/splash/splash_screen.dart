import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/utils.dart';
import '../auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = Utils.windowWidth(context);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              SvgPicture.asset(
                "assets/icons/icon_white.svg",
              ),
              SizedBox(
                width: 16 * w,
              ),

              const Spacer(),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Future<void> _getData() async {
    Timer(const Duration(milliseconds: 1250), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        ),
      );
    });
  }
}
