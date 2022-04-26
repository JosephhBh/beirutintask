import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class BtmNavigationPhone extends StatelessWidget {
  final Color color;
  BtmNavigationPhone({
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/phone_icon.svg',
      fit: BoxFit.fill,
      color: color,
      height: setCurrentHeight(35),
    );
  }
}
