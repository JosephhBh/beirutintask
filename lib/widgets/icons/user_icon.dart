import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class UserIcon extends StatelessWidget {
  final double height;
  UserIcon({
    this.height = 50,
  });
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/user_icon.svg',
      // color: appColor.darkBlueColor,
      fit: BoxFit.fill,
      height: setCurrentHeight(height),
      // width: setCurrentWidth(26),
    );
  }
}
