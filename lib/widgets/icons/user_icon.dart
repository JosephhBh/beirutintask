import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class UserIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/user_icon.svg',
      // color: appColor.darkBlueColor,
      fit: BoxFit.fill,
      height: setCurrentHeight(50),
      // width: setCurrentWidth(26),
    );
  }
}
