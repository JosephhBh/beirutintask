import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/controller/services/notification_service/notification_service.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/icons/back_icon.dart';
import 'package:tipperapp/widgets/icons/notification_icon.dart';
import 'package:tipperapp/widgets/icons/smily_face_icon.dart';
import 'package:tipperapp/widgets/notification/expanded_notification_details.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class ReceiverNotificationDetailsPage extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();
  final NotificationService _notificationService =
      locator<NotificationService>();
  final dynamic data;
  ReceiverNotificationDetailsPage({
    required this.data,
  });
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ExpandedNotificationDetails(
                  time: _notificationService.getNotificationsTime(data['date']),
                  message: data['message'],
                ),
                heighSpacer(80),
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Container(
                    height: setCurrentHeight(61),
                    width: setCurrentWidth(243),
                    color: appColor.whiteColor,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.ideographic,
                        children: [
                          GlobalText(
                            text: 'THANK YOU',
                          ),
                          widthSpacer(2),
                          SmilyFaceIcon(),
                        ],
                      ),
                    ),
                  ),
                ),
                heighSpacer(15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: setCurrentHeight(234),
                    width: setCurrentWidth(248),
                    color: appColor.darkBlueColor,
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        Container(
                          height: setCurrentHeight(185),
                          width: double.infinity,
                          color: appColor.transparentColor,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: GlobalText(
                                    text: "Worker " +
                                        authenticationProvider
                                            .receiverModel.name! +
                                        " says thank you 😊",
                                    color: appColor.whiteColor,
                                    fontSize: 14,
                                    showEllipsis: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Align(
                        //   alignment: Alignment.center,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     // crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       Expanded(
                        //         flex: 1,
                        //         child: GlobalText(
                        //           text: "Worker " +
                        //               authenticationProvider
                        //                   .receiverModel.name! +
                        //               " says thank you 😊",
                        //           color: appColor.whiteColor,
                        //           fontSize: 14,
                        //           showEllipsis: false,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Spacer(),
                        GestureDetector(
                          onTap: () {
                            _notificationService
                                .sendThankYouMessageFromReceiverToTipper(
                              data['sent_from'],
                              data['sent_to'],
                              authenticationProvider.receiverModel.name!,
                              data['id'],
                            );
                            _navigationService.pop();
                            debugPrint(data['id']);
                          },
                          child: Container(
                            color: appColor.transparentColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Divider(
                                  height: 1,
                                  thickness: 0.4,
                                  color: appColor.whiteColor,
                                ),
                                heighSpacer(10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GlobalText(
                                      text: 'SEND MESSAGE',
                                      fontSize: 18,
                                      color: appColor.whiteColor,
                                    ),
                                  ],
                                ),
                                heighSpacer(10),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
