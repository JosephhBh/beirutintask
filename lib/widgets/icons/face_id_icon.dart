import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class FaceIdIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/face_id_icon.svg',
      color: appColor.blackColor,
      height: setCurrentHeight(26),
      width: setCurrentWidth(26),
    );
  }
}
