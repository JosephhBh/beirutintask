import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tipperapp/core/constants/font_names.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';

class GlobalText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final double height;
  final bool isFredokaOne;
  final bool isBold;
  final String fontFamily;
  final bool showEllipsis;

  GlobalText({
    required this.text,
    this.color = Colors.black,
    this.fontSize = 20,
    this.height = 1.2,
    this.isFredokaOne = true,
    this.isBold = false,
    this.fontFamily = SEGOEUIREGULAR,
    this.showEllipsis = true,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: showEllipsis ? TextOverflow.ellipsis : TextOverflow.clip,
      textAlign: showEllipsis ? TextAlign.start : TextAlign.center,
      style: isFredokaOne
          ? GoogleFonts.fredokaOne(
              color: color,
              fontSize: setFontSize(fontSize),
              height: height,
            )
          : TextStyle(
              color: color,
              fontFamily: isBold ? SEGOEUIBOLD : SEGOEUIREGULAR,
              fontSize: setFontSize(fontSize),
              height: height),
    );
  }
}
