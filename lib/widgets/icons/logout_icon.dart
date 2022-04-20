import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class LogoutIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/app_icons/logout_icon.png'),
      fit: BoxFit.fill,
      height: setCurrentHeight(17),
      width: setCurrentWidth(14),
    );
  }
}
