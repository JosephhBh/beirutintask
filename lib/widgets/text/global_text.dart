import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tipperapp/core/constants/font_names.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class GlobalText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final double height;
  final bool isFredokaOne;
  final String fontFamily;

  GlobalText({
    required this.text,
    this.color = Colors.black,
    this.fontSize = 20,
    this.height = 1.2,
    this.isFredokaOne = true,
    this.fontFamily = SEGOEUIREGULAR,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isFredokaOne
          ? GoogleFonts.fredokaOne(
              color: color,
              fontSize: setFontSize(fontSize),
              height: height,
            )
          : TextStyle(
              color: color,
              fontFamily: fontFamily,
              fontSize: setFontSize(fontSize),
              height: height),
    );
  }
}
