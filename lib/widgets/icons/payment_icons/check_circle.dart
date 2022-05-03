import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class CheckCircleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/payment_icons/check_circle.svg',
      fit: BoxFit.fill,
      height: setCurrentHeight(24),
      // width: setCurrentWidth(63),
    );
  }
}
