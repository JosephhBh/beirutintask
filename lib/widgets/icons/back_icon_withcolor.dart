import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class BackIconWithColor extends StatelessWidget {
  final Color color;
  BackIconWithColor({
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/back_icon.svg',
      fit: BoxFit.fill,
      height: setCurrentHeight(30),
      color: color,
    );
  }
}
