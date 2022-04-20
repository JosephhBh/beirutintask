import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class AboutUsIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/app_icons/about_us_icon.png'),
      fit: BoxFit.fill,
      height: setCurrentHeight(25),
      width: setCurrentWidth(22),
    );
  }
}
