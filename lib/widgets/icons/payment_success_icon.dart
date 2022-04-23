import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class PaymentSuccessIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/payment_succes.svg',
      // color: appColor.blackColor,
      fit: BoxFit.fill,
      // height: setCurrentHeight(25),
      // width: setCurrentWidth(26),
    );
  }
}
