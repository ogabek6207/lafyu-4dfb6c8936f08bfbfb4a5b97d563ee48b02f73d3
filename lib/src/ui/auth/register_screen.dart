import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyu/src/model/auth/register_model.dart';
import 'package:lafyu/src/ui/auth/accept_screen.dart';
import 'package:lafyu/src/ui/menu/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_provider/app_provider.dart';
import '../../app_theme/app_theme.dart';
import '../../model/auth/login_model.dart';
import '../../repository/repository_.dart';
import '../../utils/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerFullName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerAgain = TextEditingController();
  final Repository _repository = Repository();
  bool _loading = false;

  @override
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 155 * h,
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
            width: MediaQuery
                .of(context)
                .size
                .width,
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
                  "assets/icons/user.svg",
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
                    controller: _controllerFullName,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Full Name",
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
            width: MediaQuery
                .of(context)
                .size
                .width,
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
                      ),
                    ),
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
            width: MediaQuery
                .of(context)
                .size
                .width,
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
            width: MediaQuery
                .of(context)
                .size
                .width,
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
                    controller: _controllerAgain,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password Again",
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
              _registerData(_controllerFullName.text, _controllerEmail.text, _controllerPassword.text, _controllerAgain.text);
            },
            child: Container(
              height: 57,
              margin: EdgeInsets.only(
                top: 16 * h,
                left: 16 * w,
                right: 16 * w,
                bottom: 24 * h,
              ),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
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
                  "Sign Up",
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
            margin: EdgeInsets.only(
              bottom: 113 * h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "have a account? ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.greyB1,
                      fontSize: 12 * o,
                      fontStyle: FontStyle.normal,
                      fontFamily: AppTheme.fontFamilyPoppins,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Text(
                  "Sign In",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTheme.blueFF,
                    fontSize: 12 * o,
                    fontStyle: FontStyle.normal,
                    fontFamily: AppTheme.fontFamilyPoppins,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Future<void> _registerData(
      String firstName,
      String email,
      String password,
      String confirm_password,
      ) async {
    var response = await AppProvider().registerData(
      firstName,
      email,
      password,
      confirm_password,
    );

    if (response.isSucces) {
      LoginModel loginModel = LoginModel.fromJson(response.result);
      if (loginModel.status == 1) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString("firstName", firstName);
        prefs.setString("email", email);
        prefs.setString("password", password);
        prefs.setString("confirm_password", confirm_password);


        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return  AcceptScreen(email: _controllerEmail.text);
            },
          ),
        );
      } else {
///error
      }
    } else {
      ///error
    }
  }



}
