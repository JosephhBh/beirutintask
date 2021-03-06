import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class ApplyPayeIcon extends StatelessWidget {
  final double height;
  ApplyPayeIcon({
    this.height = 30,
  });
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/payment_icons/apply_pay.svg',
      fit: BoxFit.fill,
      height: setCurrentHeight(height),
    );
  }
}
