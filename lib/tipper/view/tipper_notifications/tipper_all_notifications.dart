import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/constants/route_names.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/controller/services/notification_service/notification_service.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/icons/back_icon.dart';
import 'package:tipperapp/widgets/icons/notification_icon.dart';
import 'package:tipperapp/widgets/notification/receiver_notification_widget.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class TipperAllNotificationsPage extends StatefulWidget {
  @override
  State<TipperAllNotificationsPage> createState() =>
      _TipperAllNotificationsPageState();
}

class _TipperAllNotificationsPageState
    extends State<TipperAllNotificationsPage> {
  final NavigationService _navigationService = locator<NavigationService>();

  final NotificationService _notificationService =
      locator<NotificationService>();

  @override
  void initState() {
    super.initState();
    updateUnreadNotificationStatus();
  }

  updateUnreadNotificationStatus() async {
    var authenticationProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    await _notificationService.updateUnreadNotifcationsStatus(
        authenticationProvider.tipperModel.userId!);
  }

  @override
  Widget build(BuildContext context) {
    var authenticationProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return GlobalScaffold(
      backgroundColor: appColor.greyColor,
      child: Stack(
        fit: StackFit.loose,
        children: [
          applyPadding(
            15,
            13,
            0,
            0,
            Stack(
              fit: StackFit.loose,
              children: [
                GestureDetector(
                  onTap: () {
                    _navigationService.pop();
                  },
                  child: Container(
                    color: appColor.transparentColor,
                    height: setCurrentHeight(70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        BackIcon(),
                        widthSpacer(15),
                        GlobalText(
                          text: 'NOTIFICATIONS',
                          color: appColor.darkBlueColor,
                        ),
                        Spacer(),
                        Container(
                          width: setCurrentWidth(67),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Container(
                                  height: setCurrentHeight(49),
                                  width: setCurrentWidth(67),
                                  color: appColor.darkBlueColor,
                                  child: Center(
                                    child: NotificationIcon(
                                      color: appColor.whiteColor,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                              heighSpacer(7),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: setCurrentWidth(4),
                                  right: setCurrentWidth(4),
                                ),
                                child: Divider(
                                  height: 1,
                                  thickness: 3,
                                  color: appColor.yellowColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        widthSpacer(19),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          applyPadding(
            136,
            27,
            27,
            0,
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                children: [
                  StreamBuilder(
                    stream: _notificationService.getUnreadNotifications(
                        authenticationProvider.tipperModel.userId!),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Container(
                          height: 0,
                          width: 0,
                          // color: Colors.red,
                        );
                      } else if (snapshot.hasData) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                widthSpacer(27),
                                GlobalText(
                                  text: "NEW",
                                  color: appColor.darkBlueColor,
                                ),
                              ],
                            ),
                            heighSpacer(27),
                            ListView(
                              shrinkWrap: true,
                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // _navigationService.navigateTo(
                                        //     name: kReceiverNotificationsDetailPage,
                                        //     arguments: data);
                                      },
                                      child: ReceiverNotificationWidget(
                                        title: data['title'],
                                        message: data['message'],
                                        time: _notificationService
                                            .getNotificationsTime(data['date']),
                                        isRead: data['is_read'],
                                      ),
                                    ),
                                    heighSpacer(45),
                                  ],
                                );
                              }).toList(),
                            ),
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                  StreamBuilder(
                    stream: _notificationService.getReadNotifications(
                        authenticationProvider.tipperModel.userId!),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Container(
                          height: 0,
                          width: 0,
                          // color: Colors.red,
                        );
                      } else if (snapshot.hasData) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                widthSpacer(27),
                                GlobalText(
                                  text: "NEW",
                                  color: appColor.darkBlueColor,
                                ),
                              ],
                            ),
                            heighSpacer(27),
                            ListView(
                              shrinkWrap: true,
                              children: snapshot.data!.docs
                                  .map((DocumentSnapshot document) {
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // _navigationService.navigateTo(
                                        //     name: kReceiverNotificationsDetailPage,
                                        //     arguments: data);
                                      },
                                      child: ReceiverNotificationWidget(
                                        title: data['title'],
                                        message: data['message'],
                                        time: _notificationService
                                            .getNotificationsTime(data['date']),
                                        isRead: data['is_read'],
                                      ),
                                    ),
                                    heighSpacer(45),
                                  ],
                                );
                              }).toList(),
                            ),
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
