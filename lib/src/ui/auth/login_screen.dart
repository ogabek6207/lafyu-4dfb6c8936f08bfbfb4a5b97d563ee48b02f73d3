import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/ui/auth/forgot_password_screen.dart';
import 'package:lafyu/src/ui/auth/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/auth/login_model.dart';
import '../../repository/repository_.dart';
import '../../utils/utils.dart';
import '../dialog/center_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final Repository _repository = Repository();
  final TextEditingController _controller = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 112 * h,
              bottom: 16 * h,
            ),
            height: 72 * o,
            width: 72 * o,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16 * o),
            ),
            child: SvgPicture.asset(
              "assets/icons/lafyu.svg",
              height: 72 * o,
              width: 72 * o,
            ),
          ),
          Text(
            "Welcome to Lafyuu",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.dark63,
              fontFamily: AppTheme.fontFamilyPoppins,
              fontSize: 16 * h,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8 * h,
          ),
          Text(
            "Sign in to continue",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.greyB1,
              fontFamily: AppTheme.fontFamilyPoppins,
              fontSize: 12 * h,
              fontWeight: FontWeight.normal,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 28 * h,
              left: 16 * w,
              right: 16 * w,
            ),
            padding: EdgeInsets.only(
              left: 16 * w,
              right: 16 * w,
            ),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5 * o),
              color: AppTheme.white,
              border: Border.all(
                color: AppTheme.border,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/email.svg",
                ),
                SizedBox(
                  width: 10 * w,
                ),
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: AppTheme.greyB1,
                      fontFamily: AppTheme.fontFamilyPoppins,
                      fontSize: 12 * h,
                      fontWeight: FontWeight.normal,
                    ),
                    controller: _controllerEmail,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Your Email",
                        hintStyle: TextStyle(
                          color: AppTheme.greyB1,
                          fontFamily: AppTheme.fontFamilyPoppins,
                          fontSize: 12 * h,
                          fontWeight: FontWeight.normal,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 8 * h,
              left: 16 * w,
              right: 16 * w,
            ),
            padding: EdgeInsets.only(
              left: 16 * w,
              right: 16 * w,
            ),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5 * o),
              color: AppTheme.white,
              border: Border.all(
                color: AppTheme.border,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/password.svg",
                ),
                SizedBox(
                  width: 10 * w,
                ),
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: AppTheme.greyB1,
                      fontFamily: AppTheme.fontFamilyPoppins,
                      fontSize: 12 * h,
                      fontWeight: FontWeight.normal,
                    ),
                    controller: _controllerPassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: AppTheme.greyB1,
                        fontFamily: AppTheme.fontFamilyPoppins,
                        fontSize: 12 * h,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              sendData(_controllerEmail.text, _controllerPassword.text);
            },
            child: Container(
              height: 57,
              margin: EdgeInsets.only(
                top: 16 * h,
                left: 16 * w,
                right: 16 * w,
                bottom: 21 * h,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5 * o),
                color: AppTheme.blueFF,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.blueFF.withOpacity(0.24),
                    spreadRadius: 0,
                    blurRadius: 30,
                    offset: Offset(0, 10 * o), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "Sign In",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 0.5,
                    color: AppTheme.white,
                    fontFamily: AppTheme.fontFamilyPoppins,
                    fontSize: 14 * h,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 21 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              left: 16 * w,
              right: 16 * w,
            ),
            child: Row(
              children: [
                Container(
                  height: 1,
                  width: (MediaQuery.of(context).size.width - 68) / 2,
                  color: AppTheme.border,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "OR",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 0.005,
                        color: AppTheme.greyB1,
                        fontFamily: AppTheme.fontFamilyPoppins,
                        fontSize: 14 * h,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  width: (MediaQuery.of(context).size.width - 68) / 2,
                  color: AppTheme.border,
                ),
              ],
            ),
          ),
          Container(
            height: 57,
            margin: EdgeInsets.only(
              top: 16 * h,
              left: 16 * w,
              right: 16 * w,
              bottom: 8 * h,
            ),
            padding: EdgeInsets.only(left: 16 * w, right: 40 * w),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppTheme.border,
              ),
              borderRadius: BorderRadius.circular(5 * o),
              color: AppTheme.white,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.blueFF.withOpacity(0.24),
                  spreadRadius: 0,
                  blurRadius: 30,
                  offset: Offset(0, 10 * o), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/google.png",
                  height: 24 * o,
                  width: 24 * o,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Login with Google",
                      style: TextStyle(
                        letterSpacing: 0.5,
                        color: AppTheme.greyB1,
                        fontFamily: AppTheme.fontFamilyPoppins,
                        fontSize: 14 * h,
                        height: 1.8 * h,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 57,
            margin: EdgeInsets.only(
              left: 16 * w,
              right: 16 * w,
              bottom: 16 * h,
            ),
            padding: EdgeInsets.only(left: 16 * w, right: 40 * w),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppTheme.border,
              ),
              borderRadius: BorderRadius.circular(5 * o),
              color: AppTheme.white,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.blueFF.withOpacity(0.24),
                  spreadRadius: 0,
                  blurRadius: 30,
                  offset: Offset(0, 10 * o), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/facebook.png",
                  height: 24 * o,
                  width: 24 * o,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Login with facebook",
                      style: TextStyle(
                        letterSpacing: 0.5,
                        color: AppTheme.greyB1,
                        fontFamily: AppTheme.fontFamilyPoppins,
                        fontSize: 14 * h,
                        height: 1.8 * h,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgotPasswordScreen(),
                ),
              );
            },
            child: Text(
              "Forgot Password?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.blueFF,
                fontSize: 12 * o,
                fontStyle: FontStyle.normal,
                fontFamily: AppTheme.fontFamilyPoppins,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 8 * h,
              bottom: 113 * h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have a account? ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTheme.greyB1,
                    fontSize: 12 * o,
                    fontStyle: FontStyle.normal,
                    fontFamily: AppTheme.fontFamilyPoppins,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const RegisterScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Register",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.blueFF,
                      fontSize: 12 * o,
                      fontStyle: FontStyle.normal,
                      fontFamily: AppTheme.fontFamilyPoppins,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> sendData(String firstName, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      "email",
      _controllerEmail.text,
    );
    prefs.setString(
      "password",
      _controllerPassword.text,
    );

    var info = await _repository.sendLogin(firstName, password);
    setState(() {
      _loading = true;
    });
    if (info.isSucces) {
      LoginModel loginModel = LoginModel.fromJson(info.result);
      setState(() {
        _loading = false;
      });
      if (loginModel.status == 1) {}
    } else {
      setState(
        () {},
      );
    }
  }
}
