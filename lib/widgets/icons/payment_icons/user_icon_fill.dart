import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class UserIconFill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/payment_icons/user_icon_fill.svg',
      fit: BoxFit.fill,
      height: setCurrentHeight(58),
    );
  }
}
