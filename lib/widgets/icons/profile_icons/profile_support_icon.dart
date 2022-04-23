import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class ProfileSupportIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/profile_icons/support_icon.svg',
      fit: BoxFit.fill,
      height: setCurrentHeight(30),
    );
  }
}
