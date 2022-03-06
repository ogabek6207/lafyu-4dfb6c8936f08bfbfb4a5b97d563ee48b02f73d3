import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class NotificationTypeWidget extends StatefulWidget {
  final String image;
  final String name;
  final int count;

  const NotificationTypeWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.count,
  }) : super(key: key);

  @override
  _NotificationTypeWidgetState createState() => _NotificationTypeWidgetState();
}

class _NotificationTypeWidgetState extends State<NotificationTypeWidget> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Container(
      child: Row(
        children: [
          SizedBox(
            child: CachedNetworkImage(
              imageUrl: widget.image,
              placeholder: (context, url) =>
                  const CircularProgressIndicator.adaptive(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            height: 24 * h,
            width: 24 * h,
          ),
        ],
      ),
    );
  }
}
