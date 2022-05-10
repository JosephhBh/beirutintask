import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoutIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/profile_icons/logout_icon.svg',
      fit: BoxFit.fill,
    );
  }
}
