import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class PaymentContainer extends StatelessWidget {
  final String text;
  final double height;
  final Widget icon;
  PaymentContainer({
    required this.text,
    this.height = 76,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: setCurrentHeight(height),
      width: double.infinity,
      decoration: BoxDecoration(
        color: appColor.transparentColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: appColor.whiteColor,
          width: 3,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: setCurrentWidth(50),
              // color: Colors.red,
              child: Center(
                child: icon,
              ),
            ),
            widthSpacer(8),
            GlobalText(
              text: text,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
