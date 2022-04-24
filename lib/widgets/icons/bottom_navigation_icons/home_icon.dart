import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class BtmNavigationHome extends StatelessWidget {
  final Color? color;
  BtmNavigationHome({
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/profile_icons/home_icon.svg',
      fit: BoxFit.fill,
      // height: setCurrentHeight(30),
      color: color,
    );
  }
}
