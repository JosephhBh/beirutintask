import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/widgets/icons/home_icon.dart';
import 'package:tipperapp/widgets/icons/logout_icon.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class LogoutButton extends StatelessWidget {
  final Function() onPressed;
  LogoutButton({
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: setCurrentHeight(61),
        width: double.infinity,
        color: appColor.whiteColor,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textBaseline: TextBaseline.ideographic,
            children: [
              LogoutIcon(),
              widthSpacer(5),
              GlobalText(
                text: 'Logout',
                color: appColor.blackColor.withOpacity(0.6),
                fontSize: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
