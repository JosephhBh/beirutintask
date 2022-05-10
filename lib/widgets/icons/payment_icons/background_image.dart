import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class PaymentBackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/payment_icons/payment_background.png'),
      fit: BoxFit.fill,
      height: setCurrentHeight(220),
      width: setCurrentWidth(220),
    );
  }
}
