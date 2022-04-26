import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/controller/services/notification_service/notification_service.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/icons/support/background_icon.dart';
import 'package:tipperapp/widgets/icons/support/call_us_icon.dart';
import 'package:tipperapp/widgets/icons/support/email.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class ReceiverSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
        backgroundColor: appColor.greyColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: setCurrentHeight(355),
                width: double.infinity,
                color: appColor.yellowColor,
                child: Center(
                  child: SupportBackgroundIcon(),
                ),
              ),
              heighSpacer(108),
              Container(
                height: setCurrentHeight(92),
                width: setCurrentWidth(140),
                decoration: BoxDecoration(
                    color: appColor.whiteColor,
                    borderRadius: BorderRadius.circular(19)),
                child: Center(
                  child: SupportCallUsIcon(),
                ),
              ),
              heighSpacer(26),
              GlobalText(
                text: 'Call us',
                color: appColor.blackColor.withOpacity(0.66),
              ),
              heighSpacer(44),
              Container(
                height: setCurrentHeight(92),
                width: setCurrentWidth(140),
                decoration: BoxDecoration(
                    color: appColor.whiteColor,
                    borderRadius: BorderRadius.circular(19)),
                child: Center(
                  child: SupportEmailIcon(),
                ),
              ),
              heighSpacer(26),
              GlobalText(
                text: 'Email us',
                color: appColor.blackColor.withOpacity(0.66),
              ),
            ],
          ),
        ));
  }
}
