import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class AboutUsIconLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/about_us_icon_logo.svg',
      fit: BoxFit.fill,
      height: setCurrentHeight(256),
      // color: color,
    );
  }
}
