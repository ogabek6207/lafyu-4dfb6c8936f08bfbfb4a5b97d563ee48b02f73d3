import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/bloc/notification/notification_type_bloc.dart';
import 'package:lafyu/src/model/notification/notification_type_model.dart';
import 'package:lafyu/src/ui/notification/notification_screen.dart';
import 'package:lafyu/src/widget/app_widget.dart';
import 'package:lafyu/src/widget/notification/notification_type_widget.dart';

import '../../utils/utils.dart';

class NotificationTypeScreen extends StatefulWidget {
  const NotificationTypeScreen({Key? key}) : super(key: key);

  @override
  _NotificationTypeScreenState createState() => _NotificationTypeScreenState();
}

class _NotificationTypeScreenState extends State<NotificationTypeScreen> {
  NotificationTypeModel? notificationTypeModel;

  @override
  void initState() {
    notificationTypeBloc.getNotificationType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.white,
        title: const AppBarWidget(
          title: "Notification",
        ),
      ),
      backgroundColor: AppTheme.white,
      body: Column(
        children: [
          StreamBuilder<NotificationTypeModel>(
            stream: notificationTypeBloc.fetchNotificationType,
            builder: (context, snapshot) {
              if (snapshot.hasData || notificationTypeModel != null) {
                if (snapshot.hasData) {
                  notificationTypeModel = snapshot.data;
                }
                List<NotificationTypeResult> result =
                    notificationTypeModel!.results;
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: result.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationScreen(
                                category: result[index].name,
                                id: result[index].id,
                              ),
                            ),
                          );
                        },
                        child: NotificationTypeWidget(
                            image: result[index].image,
                            name: result[index].name,
                            count: 1),
                      );
                    },
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
