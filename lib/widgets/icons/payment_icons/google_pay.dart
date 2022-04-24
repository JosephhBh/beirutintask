import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class GooglePayIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/payment_icons/google_pay.svg',
      fit: BoxFit.fill,
      height: setCurrentHeight(30),
    );
  }
}
