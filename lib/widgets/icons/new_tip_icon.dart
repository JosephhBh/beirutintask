import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class NewTipIcon extends StatelessWidget {
  final double height;
  NewTipIcon({
    this.height = 45,
  });
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/tip_icon.svg',
      fit: BoxFit.fill,
      height: setCurrentHeight(height),
    );
  }
}
