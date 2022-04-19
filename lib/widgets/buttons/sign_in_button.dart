import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class SignInButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  SignInButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: setCurrentHeight(41),
          color: appColor.yellowColor,
          child: Center(
            child: GlobalText(
              text: text,
              color: appColor.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
