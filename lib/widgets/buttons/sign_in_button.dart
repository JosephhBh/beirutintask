import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class SignInButton extends StatelessWidget {
  final String text;
  final bool isYellow;
  final Function() onPressed;
  SignInButton({
    required this.text,
    this.isYellow = true,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: setCurrentHeight(41),
          color: isYellow ? appColor.yellowColor : appColor.whiteColor,
          child: Center(
            child: GlobalText(
              text: text,
              color: isYellow ? appColor.whiteColor : appColor.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
