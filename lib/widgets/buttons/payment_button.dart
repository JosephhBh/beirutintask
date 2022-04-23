import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class PaymentButton extends StatelessWidget {
  final Function() onPressed;
  PaymentButton({
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: setCurrentHeight(57),
        width: double.infinity,
        color: appColor.whiteColor,
        child: Center(
          child: GlobalText(
            text: 'Pay Now',
            color: appColor.blackColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
