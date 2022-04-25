import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/widgets/icons/user_icon.dart';
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
              UserIcon(),
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
                color: appColor.transparentColor,
                child: QrImage(
                  backgroundColor: appColor.transparentColor,
                  foregroundColor: appColor.darkBlueColor,
                  data: receiverUid,
                  version: QrVersions.auto,
                  // size: 200.0,
                ),
              ),
              heighSpacer(100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GlobalText(
                    text: "Code : " + receiverUid.substring(4),
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
