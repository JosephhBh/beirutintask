import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class NewTipIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/app_icons/new_tip_icon.png'),
      fit: BoxFit.fill,
    );
  }
}
