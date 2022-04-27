import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class BackIcon extends StatelessWidget {
  // final Color color;
  // BackIcon({
  //   required this.color,
  // });
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/back_icon.svg',
      fit: BoxFit.fill,
      height: setCurrentHeight(30),
      // color: color,
    );
  }
}
