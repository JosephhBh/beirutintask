import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class AboutUsIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/profile_icons/about_us_icon.svg',
      fit: BoxFit.fill,
      height: setCurrentHeight(30),
    );
  }
}
