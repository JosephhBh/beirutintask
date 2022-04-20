import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class ReceiverBarcodeContainer extends StatelessWidget {
  final String username;
  final String receiverUid;
  ReceiverBarcodeContainer({
    required this.username,
    required this.receiverUid,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(29),
      child: Container(
        height: setCurrentHeight(629),
        width: setCurrentWidth(337),
        color: appColor.yellowColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              heighSpacer(29),
              Icon(
                CupertinoIcons.profile_circled,
                size: 50,
                color: appColor.darkBlueColor,
              ),
              heighSpacer(9),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GlobalText(
                    text: username,
                    color: appColor.darkBlueColor,
                    fontSize: 20,
                  ),
                  Icon(
                    Icons.verified,
                    size: 20,
                    color: appColor.darkBlueColor,
                  ),
                ],
              ),
              heighSpacer(77),
              Container(
                height: setCurrentHeight(240),
                width: setCurrentWidth(240),
                color: appColor.darkBlueColor,
              ),
              heighSpacer(100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GlobalText(
                    text: "Code : " + receiverUid.substring(18),
                    color: appColor.darkBlueColor,
                    fontSize: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
