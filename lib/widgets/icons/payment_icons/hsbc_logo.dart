import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class HSBCLogo extends StatelessWidget {
  final double height;
  HSBCLogo({
    this.height = 40,
  });
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/payment_icons/hsbc_logo.svg',
      fit: BoxFit.fill,
      height: setCurrentHeight(height),
      // width: setCurrentWidth(63),
    );
  }
}
