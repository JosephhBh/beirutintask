import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/widgets/icons/home_icon.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class ProfileSelectionContainer extends StatelessWidget {
  final Widget icon;
  final String text;
  ProfileSelectionContainer({
    required this.icon,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: setCurrentHeight(61),
      width: double.infinity,
      color: appColor.whiteColor,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            widthSpacer(26),
            icon,
            widthSpacer(30),
            GlobalText(
              text: text,
              color: appColor.blackColor.withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }
}
