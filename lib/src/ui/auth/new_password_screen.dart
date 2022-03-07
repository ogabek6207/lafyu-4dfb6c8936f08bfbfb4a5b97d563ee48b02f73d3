import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyu/src/ui/dialog/center_dialog.dart';
import 'package:lafyu/src/ui/menu/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_theme/app_theme.dart';
import '../../model/auth/login_model.dart';
import '../../repository/repository_.dart';
import '../../utils/utils.dart';
import '../../widget/save_widget.dart';

class NewPasswordScreen extends StatefulWidget {
  final String email;

  const NewPasswordScreen({Key? key, required this.email}) : super(key: key);

  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final Repository _repository = Repository();
  final TextEditingController _controllerOldPassword = TextEditingController();
  final TextEditingController _controllerNewPassword = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
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
                Column(
                  children: [
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
                              controller: _controllerOldPassword,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "New Password",
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
                        top: 16 * h,
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
                              controller: _controllerNewPassword,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "New Password Again",
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
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              sendData(
                _controllerOldPassword.text,
              );
            },
            child: SaveWidget(
              title: "Send",
            ),
          ),
        ],
      ),
    );
  }

  Future<void> sendData(String login) async {
    var info = await _repository.sendEmail(login);
    setState(() {
      _loading = true;
    });
    if (info.isSucces) {
      LoginModel loginModel = LoginModel.fromJson(info.result);
      setState(() {
        _loading = false;
      });
      if (loginModel.status == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const MainScreen();
            },
          ),
        );
      }
    } else {
      setState(
        () {
          _loading = false;
        },
      );

      CenterDialog.showErrorDialog(
          context, "User not found or login or password error");
    }
  }
}
