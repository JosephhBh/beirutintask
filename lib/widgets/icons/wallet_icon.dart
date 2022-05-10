import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/wallet_icon.svg',
      // color: appColor.blackColor,
      fit: BoxFit.fill,
      // height: setCurrentHeight(18),
      // width: setCurrentWidth(26),
    );
  }
}
