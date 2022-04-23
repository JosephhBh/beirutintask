import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class CheckIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/check_icon.svg',
      // color: appColor.blackColor,
      fit: BoxFit.fill,
      // height: setCurrentHeight(25),
      // width: setCurrentWidth(26),
    );
  }
}