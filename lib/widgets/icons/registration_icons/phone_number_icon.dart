import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhoneNumberIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/phone_icon.svg',
      // color: appColor.blackColor,
      fit: BoxFit.fill,
      // height: setCurrentHeight(25),
      // width: setCurrentWidth(26),
    );
  }
}
