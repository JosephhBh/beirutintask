import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/password_icon.svg',
      // color: appColor.blackColor,
      fit: BoxFit.fill,
      // height: setCurrentHeight(25),
      // width: setCurrentWidth(26),
    );
  }
}
