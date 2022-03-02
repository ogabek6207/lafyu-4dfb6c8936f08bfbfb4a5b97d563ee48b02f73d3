import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lafyu/src/widget/app_widget.dart';
import 'package:lafyu/src/widget/save_widget.dart';
import '../../../app_theme/app_theme.dart';
import '../../../utils/utils.dart';

class EditGenderScreen extends StatefulWidget {
  const EditGenderScreen({Key? key}) : super(key: key);

  @override
  _EditGenderScreenState createState() => _EditGenderScreenState();
}

class _EditGenderScreenState extends State<EditGenderScreen> {
  String dropDownValue = 'Male';

  var items = [
    'Male',
    'Female',
    'Other',
  ];

  String? value;

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      body: Column(
        children: [
        AppBarWidget(title: "Gender"),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16*h,),
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 16 * w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Choose Gender",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppTheme.dark63,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              fontSize: 14 * o,
                              height: 1.5,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 48 * h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5 * o),
                        ),
                        margin: EdgeInsets.only(
                            top: 12 * h, bottom: 24 * h, right: 16 * w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: Container(
                          height: 48 * h,
                          width: MediaQuery.of(context).size.width,
                          child: DropdownButton(
                            value: dropDownValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(
                                () {
                                  dropDownValue = newValue!;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SaveWidget(title: "Save"),
        ],
      ),
    );
  }
}
