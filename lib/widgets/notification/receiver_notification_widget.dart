import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/widgets/icons/new_tip_icon.dart';
import 'package:tipperapp/widgets/icons/payment_success_icon.dart';
import 'package:tipperapp/widgets/icons/thanks_message_icon.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class ReceiverNotificationWidget extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final bool isRead;
  ReceiverNotificationWidget({
    required this.title,
    required this.message,
    required this.time,
    required this.isRead,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
          height: setCurrentHeight(88),
          width: double.infinity,
          color: isRead ? appColor.darkGrey : appColor.darkBlueColor,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: setCurrentWidth(16),
                  right: setCurrentWidth(30),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: setCurrentHeight(45),
                        width: setCurrentWidth(45),
                        child: Center(
                          child: title == "PAYMENT SUCCESSFUL"
                              ? PaymentSuccessIcon()
                              : title == "THANK YOU MESSAGE"
                                  ? ThanksMessageIcon()
                                  : NewTipIcon(),
                        ),
                      ),
                      widthSpacer(15),
                      Container(
                        width: setCurrentWidth(266),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GlobalText(
                              text: title,
                              color: appColor.whiteColor,
                              fontSize: 15,
                            ),
                            GlobalText(
                              text: message,
                              color: appColor.whiteColor,
                              fontSize: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: setCurrentHeight(5),
                    right: setCurrentWidth(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.lock_clock,
                        color: appColor.whiteColor,
                        size: 14,
                      ),
                      GlobalText(
                        text: time,
                        color: appColor.whiteColor,
                        fontSize: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
