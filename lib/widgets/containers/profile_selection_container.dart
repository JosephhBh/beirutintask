import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
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
            Container(
              width: setCurrentWidth(70),
              color: appColor.transparentColor,
              child: Center(
                child: icon,
              ),
            ),
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
