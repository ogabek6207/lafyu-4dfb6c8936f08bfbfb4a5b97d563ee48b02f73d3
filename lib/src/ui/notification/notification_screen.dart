import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/bloc/notification/notification_bloc.dart';
import 'package:lafyu/src/model/notification_model.dart';
import 'package:lafyu/src/widget/app_widget.dart';
import 'package:lafyu/src/widget/notification/notification_widget.dart';

import '../../utils/utils.dart';

class NotificationScreen extends StatefulWidget {
  final String category;
  final int id;

  const NotificationScreen({Key? key, required this.category, required this.id})
      : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    notificationBloc.getNotification(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.white,
        automaticallyImplyLeading: false,
        title: AppBarWidget(
          title: widget.category,
        ),
      ),
      body: StreamBuilder<NotificationModel>(
        stream: notificationBloc.fetchNotification,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            NotificationModel result = snapshot.data!;
            return Column(
              children: [
                SizedBox(height: 16*h,),
                Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) => NotificationWidget(
                      date: DateTime.now(),
                      title:
                          result.text,
                      name: result.name,
                      image: "",
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
