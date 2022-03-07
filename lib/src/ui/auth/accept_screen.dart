import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyu/src/ui/auth/new_password_screen.dart';
import 'package:lafyu/src/ui/dialog/center_dialog.dart';
import 'package:lafyu/src/ui/menu/main_screen.dart';
import 'package:lafyu/src/widget/save_widget.dart';
import '../../app_provider/app_provider.dart';
import '../../app_theme/app_theme.dart';
import '../../model/auth/login_model.dart';
import '../../utils/utils.dart';

class AcceptScreen extends StatefulWidget {
  final String email;

  const AcceptScreen({Key? key, required this.email}) : super(key: key);

  @override
  _AcceptScreenState createState() => _AcceptScreenState();
}

class _AcceptScreenState extends State<AcceptScreen> {
  final TextEditingController _controllerCode = TextEditingController();

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
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          maxLength: 4,
                          style: TextStyle(
                            color: AppTheme.greyB1,
                            fontFamily: AppTheme.fontFamilyPoppins,
                            fontSize: 12 * h,
                            fontWeight: FontWeight.normal,
                          ),
                          controller: _controllerCode,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Sms Code",
                            counterText: "",
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
              ],
            ),
          ),
          GestureDetector(
              onTap: () {
                _acceptData(_controllerCode.text, widget.email);
              },
              child: SaveWidget(title: "Send")),
        ],
      ),
    );
  }

  Future<void> _acceptData(
    String smsCode,
    String email,
  ) async {
    var response = await AppProvider().acceptData(
      smsCode,
      email,
    );

    if (response.isSucces) {
      LoginModel loginModel = LoginModel.fromJson(response.result);
      if (loginModel.status == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return NewPasswordScreen(email: email);
            },
          ),
        );
      } else {
        CenterDialog.showErrorDialog(context, loginModel.msg);
      }
    } else {
      ///error
    }
  }
}
