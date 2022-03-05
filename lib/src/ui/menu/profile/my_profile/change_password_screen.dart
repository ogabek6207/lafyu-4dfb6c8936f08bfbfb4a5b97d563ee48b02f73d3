import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/utils/utils.dart';
import 'package:lafyu/src/widget/app_widget.dart';
import 'package:lafyu/src/widget/pasword_widget.dart';
import 'package:lafyu/src/widget/save_widget.dart';
import 'package:lafyu/src/widget/title_widget.dart';


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _controllerOldPassword = TextEditingController();
  final TextEditingController _controllerNewPassword = TextEditingController();
  final TextEditingController _controllerNewPasswordAgain =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.white,
        elevation: 1,
        title: const AppBarWidget(title: "Change Password"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 16 * w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const TitleWidget(title: "Old Password"),
                      PasswordWidget(
                          hintText: "Old Password",
                          controller: _controllerOldPassword),
                      const TitleWidget(title: "New Password"),
                      PasswordWidget(
                          hintText: "New Password",
                          controller: _controllerNewPassword),
                      const TitleWidget(title: "New Password Again"),
                      PasswordWidget(
                          hintText: "New Password Again",
                          controller: _controllerNewPasswordAgain),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SaveWidget(
            title: "Save",
          ),
        ],
      ),
    );
  }
}
