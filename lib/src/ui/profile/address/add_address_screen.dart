import 'package:flutter/material.dart';
import 'package:lafyu/src/widget/add_adress_widget.dart';
import 'package:lafyu/src/widget/app_widget.dart';
import 'package:lafyu/src/widget/title_widget.dart';
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

  String dropDownValue = 'United Kingdom';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.white,
        elevation: 1,
        title: const AppBarWidget(title: "Add Address"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(
                top: 16 * h,
              ),
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 16 * w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const TitleWidget(title: "Country or region"),
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
                            top: 12 * h, bottom: 8 * h, right: 16 * w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: Container(
                          height: 48 * h,
                          width: MediaQuery.of(context).size.width,
                          child: DropdownButton(
                            elevation: 10,
                            isExpanded: true,
                            value: dropDownValue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
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
                      const TitleWidget(title: "First Name"),
                      AddAddressWidget(
                          controller: _controllerFirstName,
                          hintText: "First Name"),
                      const TitleWidget(title: "Last Name"),
                      AddAddressWidget(
                          controller: _controllerLastName,
                          hintText: "Last Name"),
                      const TitleWidget(title: "Street Address"),
                      AddAddressWidget(
                          controller: _controllerStreet,
                          hintText: "Street Address"),
                      const TitleWidget(title: "Street Address 2 (Optional)"),
                      AddAddressWidget(
                          controller: _controllerStreetOptional,
                          hintText: "Street Address 2 (Optional)"),
                      const TitleWidget(title: "City"),
                      AddAddressWidget(
                          controller: _controllerCity, hintText: "City"),
                      const TitleWidget(title: "State/Province/Region"),
                      AddAddressWidget(
                          controller: _controllerRegion,
                          hintText: "State/Province/Region"),
                      const TitleWidget(title: "Zip Code"),
                      AddAddressWidget(
                          controller: _controllerZipCode, hintText: "Zip Code"),
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
