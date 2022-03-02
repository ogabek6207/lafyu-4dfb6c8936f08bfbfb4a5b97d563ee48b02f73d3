import 'package:flutter/material.dart';
import 'package:lafyu/src/widget/app_widget.dart';
import '../../../app_theme/app_theme.dart';
import '../../../utils/utils.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  TextEditingController _controllerRegion = TextEditingController();
  TextEditingController _controllerFirstName = TextEditingController();
  TextEditingController _controllerLastName = TextEditingController();
  TextEditingController _controllerStreet = TextEditingController();
  TextEditingController _controllerStreetOptional = TextEditingController();
  TextEditingController _controllerCity = TextEditingController();
  TextEditingController _controller = TextEditingController();
  TextEditingController _controllerState = TextEditingController();
  TextEditingController _controllerZipCode = TextEditingController();
  TextEditingController _controllerPhoneNumber = TextEditingController();
  String dropDownValue = 'United States';

  var items = [
    'United Kingdom',
    'Afghanistan',
    'Albania',
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
          AppBarWidget(title: "Add Address"),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 16*h,),
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 16 * w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Row(
                      //   children: [
                      //     Text(
                      //       "Country or region",
                      //       textAlign: TextAlign.start,
                      //       style: TextStyle(
                      //         color: AppTheme.dark63,
                      //         fontFamily: AppTheme.fontFamilyPoppins,
                      //         fontSize: 14 * o,
                      //         height: 1.5,
                      //         fontStyle: FontStyle.normal,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Container(
                      //   height: 48 * h,
                      //   decoration: BoxDecoration(
                      //     border: Border.all(
                      //       color: AppTheme.border,
                      //       width: 1,
                      //     ),
                      //     borderRadius: BorderRadius.circular(5 * o),
                      //   ),
                      //   margin: EdgeInsets.only(
                      //       top: 12 * h, bottom: 24 * h, right: 16 * w),
                      //   padding: EdgeInsets.symmetric(
                      //     horizontal: 16 * w,
                      //   ),
                      //   child: Container(
                      //     height: 48 * h,
                      //     width: MediaQuery.of(context).size.width,
                      //     child: DropdownButton(
                      //       value: dropDownValue,
                      //       icon: const Icon(Icons.keyboard_arrow_down),
                      //       items: items.map((String items) {
                      //         return DropdownMenuItem(
                      //           value: items,
                      //           child: Text(items),
                      //         );
                      //       }).toList(),
                      //       // After selecting the desired option,it will
                      //       // change button value to selected value
                      //       onChanged: (String? newValue) {
                      //         setState(
                      //               () {
                      //             dropDownValue = newValue!;
                      //           },
                      //         );
                      //       },
                      //     ),
                      //   ),
                      // ),
                      Row(
                        children: [
                          Text(
                            "First Name",
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
                        child: TextField(
                          style: TextStyle(
                            color: AppTheme.greyB1,
                            fontSize: 12 * o,
                            height: 1.8,
                            letterSpacing: 0.5,
                            fontFamily: AppTheme.fontFamilyPoppins,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: _controllerFirstName,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "First Name",
                            hintStyle: TextStyle(
                              color: AppTheme.greyB1,
                              fontSize: 12 * o,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Last Name",
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
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5 * o),
                        ),
                        margin: EdgeInsets.only(
                          top: 12 * h,
                          bottom: 24 * h,
                          right: 16 * w,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: TextField(
                          style: TextStyle(
                            color: AppTheme.greyB1,
                            fontSize: 12 * o,
                            height: 1.8,
                            letterSpacing: 0.5,
                            fontFamily: AppTheme.fontFamilyPoppins,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: _controllerLastName,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Last Name",
                            hintStyle: TextStyle(
                              color: AppTheme.greyB1,
                              fontSize: 12 * o,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Last Name",
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
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5 * o),
                        ),
                        margin: EdgeInsets.only(
                          top: 12 * h,
                          bottom: 24 * h,
                          right: 16 * w,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: TextField(
                          style: TextStyle(
                            color: AppTheme.greyB1,
                            fontSize: 12 * o,
                            height: 1.8,
                            letterSpacing: 0.5,
                            fontFamily: AppTheme.fontFamilyPoppins,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: _controllerLastName,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Last Name",
                            hintStyle: TextStyle(
                              color: AppTheme.greyB1,
                              fontSize: 12 * o,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Last Name",
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
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5 * o),
                        ),
                        margin: EdgeInsets.only(
                          top: 12 * h,
                          bottom: 24 * h,
                          right: 16 * w,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: TextField(
                          style: TextStyle(
                            color: AppTheme.greyB1,
                            fontSize: 12 * o,
                            height: 1.8,
                            letterSpacing: 0.5,
                            fontFamily: AppTheme.fontFamilyPoppins,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: _controllerLastName,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Last Name",
                            hintStyle: TextStyle(
                              color: AppTheme.greyB1,
                              fontSize: 12 * o,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Last Name",
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
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5 * o),
                        ),
                        margin: EdgeInsets.only(
                          top: 12 * h,
                          bottom: 24 * h,
                          right: 16 * w,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: TextField(
                          style: TextStyle(
                            color: AppTheme.greyB1,
                            fontSize: 12 * o,
                            height: 1.8,
                            letterSpacing: 0.5,
                            fontFamily: AppTheme.fontFamilyPoppins,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: _controllerLastName,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Last Name",
                            hintStyle: TextStyle(
                              color: AppTheme.greyB1,
                              fontSize: 12 * o,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Last Name",
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
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5 * o),
                        ),
                        margin: EdgeInsets.only(
                          top: 12 * h,
                          bottom: 24 * h,
                          right: 16 * w,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: TextField(
                          style: TextStyle(
                            color: AppTheme.greyB1,
                            fontSize: 12 * o,
                            height: 1.8,
                            letterSpacing: 0.5,
                            fontFamily: AppTheme.fontFamilyPoppins,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: _controllerLastName,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Last Name",
                            hintStyle: TextStyle(
                              color: AppTheme.greyB1,
                              fontSize: 12 * o,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Last Name",
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
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5 * o),
                        ),
                        margin: EdgeInsets.only(
                          top: 12 * h,
                          bottom: 24 * h,
                          right: 16 * w,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: TextField(
                          style: TextStyle(
                            color: AppTheme.greyB1,
                            fontSize: 12 * o,
                            height: 1.8,
                            letterSpacing: 0.5,
                            fontFamily: AppTheme.fontFamilyPoppins,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: _controllerLastName,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Last Name",
                            hintStyle: TextStyle(
                              color: AppTheme.greyB1,
                              fontSize: 12 * o,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Last Name",
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
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5 * o),
                        ),
                        margin: EdgeInsets.only(
                          top: 12 * h,
                          bottom: 24 * h,
                          right: 16 * w,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: TextField(
                          style: TextStyle(
                            color: AppTheme.greyB1,
                            fontSize: 12 * o,
                            height: 1.8,
                            letterSpacing: 0.5,
                            fontFamily: AppTheme.fontFamilyPoppins,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: _controllerLastName,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Last Name",
                            hintStyle: TextStyle(
                              color: AppTheme.greyB1,
                              fontSize: 12 * o,
                              fontFamily: AppTheme.fontFamilyPoppins,
                              fontStyle: FontStyle.normal,
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
        ],
      ),
    );
  }
}
