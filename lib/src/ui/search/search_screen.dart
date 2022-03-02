import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';

import '../../model/event/event_bottom_model.dart';
import '../../utils/rx_bus.dart';
import '../../utils/utils.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _registerBus();
    super.initState();
  }

  @override
  void dispose() {
    RxBus.destroy(tag: "baqay_category");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 1,
        title: Row(
          children: [
            SvgPicture.asset("assets/icons/search.svg"),
            SizedBox(
              width: 8 * w,
            ),
            Expanded(
              child: TextField(
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 12 * o,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppTheme.fontFamilyPoppins,
                ),
                controller: _controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }

  void _registerBus() {
    RxBus.register<EventBottomModel>(tag: "baqay_category").listen(
      (event) {
        print(event.position);
        setState(() {
          _controller.text = event.position.toString();
        });
      },
    );
  }
}
