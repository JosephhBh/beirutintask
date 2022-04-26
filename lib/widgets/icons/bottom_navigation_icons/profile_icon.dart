import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class BtmNavigationProfile extends StatelessWidget {
  final Color? color;
  BtmNavigationProfile({
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/btm_nav_profile.svg',
      fit: BoxFit.fill,
      color: color,
      height: setCurrentHeight(35),
    );
  }
}
