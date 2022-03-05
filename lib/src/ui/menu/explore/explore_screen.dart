import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/model/event/event_bottom_model.dart';
import 'package:lafyu/src/utils/rx_bus.dart';
import 'package:lafyu/src/utils/utils.dart';



class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
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
