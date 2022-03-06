import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lafyu/src/app_theme/app_theme.dart';
import 'package:lafyu/src/bloc/notification/notification_tyoe_bloc.dart';
import 'package:lafyu/src/model/notification/notification_type_model.dart';
import 'package:lafyu/src/widget/app_widget.dart';

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
                        return Container(
                          height: 56,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                            left: 16 * w,
                            top: 16 * h,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    child: CachedNetworkImage(
                                      imageUrl: result[index].image,
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator.adaptive(),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                    height: 24 * h,
                                    width: 24 * h,
                                  ),
                                  SizedBox(
                                    width: 16 * w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      result[index].name,
                                      style: TextStyle(
                                        letterSpacing: 0.5,
                                        color: AppTheme.dark63,
                                        fontFamily: AppTheme.fontFamilyPoppins,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12 * o,
                                        fontStyle: FontStyle.normal,
                                        height: 1.5 * h,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10 * o),
                                      border: Border.all(
                                        color: AppTheme.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
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
