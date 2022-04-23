import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class SmilyFaceIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/app_icons/smily_face_icon.png'),
      fit: BoxFit.fill,
      height: setCurrentHeight(20),
      width: setCurrentWidth(20),
    );
  }
}
