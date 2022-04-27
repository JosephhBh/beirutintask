import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class FacebookIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/social/facebook.svg',
      fit: BoxFit.fill,
      height: setCurrentHeight(25),
      color: appColor.yellowColor,
    );
  }
}
