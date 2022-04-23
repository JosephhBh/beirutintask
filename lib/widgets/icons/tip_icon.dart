import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class TipIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/tip_icon.svg',
      // color: appColor.blackColor,
      fit: BoxFit.fill,
      height: setCurrentHeight(30),
      // width: setCurrentWidth(26),
    );
  }
}
