import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class SettingsIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/app_icons/settings_icon.png'),
      fit: BoxFit.fill,
      height: setCurrentHeight(25),
      width: setCurrentWidth(22),
    );
  }
}
