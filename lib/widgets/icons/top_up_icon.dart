import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class TopUpIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/top_up_icon.svg',
      fit: BoxFit.fill,
      height: setCurrentHeight(35),
    );
  }
}
