import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class ExpandedNotificationDetails extends StatelessWidget {
  final String time;
  final String message;
  ExpandedNotificationDetails({
    required this.time,
    required this.message,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: setCurrentHeight(203),
        width: double.infinity,
        color: appColor.darkBlueColor,
        child: Stack(
          fit: StackFit.loose,
          children: [
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
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  left: setCurrentWidth(25),
                  right: setCurrentWidth(25),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GlobalText(
                        text: "“" + message + "”",
                        color: appColor.whiteColor,
                        showEllipsis: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
