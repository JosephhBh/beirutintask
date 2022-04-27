import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/controller/services/notification_service/notification_service.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/icons/social/facebook_icon.dart';
import 'package:tipperapp/widgets/icons/social/instagram_icon.dart';
import 'package:tipperapp/widgets/icons/social/linkedin_icon.dart';
import 'package:tipperapp/widgets/icons/support/background_icon.dart';
import 'package:tipperapp/widgets/icons/support/call_us_icon.dart';
import 'package:tipperapp/widgets/icons/support/email.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';
import 'package:url_launcher/url_launcher.dart';

class TipperSupporPage extends StatelessWidget {
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
              GestureDetector(
                onTap: () async {
                  final Uri params = Uri(
                      scheme: 'mailto',
                      path: 'support@tipr.ae',
                      queryParameters: {
                        'subject': 'Support',
                        'body': '',
                      });
                  String url = params.toString();
                  await launchUrl(Uri.parse(url));
                },
                child: Container(
                  height: setCurrentHeight(92),
                  width: setCurrentWidth(140),
                  decoration: BoxDecoration(
                      color: appColor.whiteColor,
                      borderRadius: BorderRadius.circular(19)),
                  child: Center(
                    child: SupportEmailIcon(),
                  ),
                ),
              ),
              heighSpacer(26),
              GlobalText(
                text: 'Email us',
                color: appColor.blackColor.withOpacity(0.66),
              ),
              heighSpacer(89),
              Container(
                width: setCurrentWidth(221),
                // height: setCurrentHeight(100),
                color: appColor.transparentColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      textBaseline: TextBaseline.ideographic,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: setCurrentHeight(28),
                          width: setCurrentWidth(45),
                          child: Divider(
                            height: 1,
                            color: appColor.yellowColor,
                            thickness: 2.5,
                          ),
                        ),
                        widthSpacer(12),
                        Container(
                          height: setCurrentHeight(20),
                          color: appColor.transparentColor,
                          child: Center(
                            child: GlobalText(
                              text: "Our Socials",
                              color: appColor.blackColor.withOpacity(0.66),
                              fontSize: 18,
                              height: 1,
                            ),
                          ),
                        ),
                        widthSpacer(12),
                        Container(
                          height: setCurrentHeight(28),
                          width: setCurrentWidth(45),
                          child: Divider(
                            height: 1,
                            color: appColor.yellowColor,
                            thickness: 2.5,
                          ),
                        ),
                      ],
                    ),
                    heighSpacer(34),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(19),
                          child: Container(
                            height: setCurrentHeight(48),
                            width: setCurrentWidth(52),
                            color: appColor.whiteColor,
                            child: Center(
                              child: InstagramIcon(),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(19),
                          child: Container(
                            height: setCurrentHeight(48),
                            width: setCurrentWidth(52),
                            color: appColor.whiteColor,
                            child: Center(
                              child: FacebookIcon(),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(19),
                          child: Container(
                            height: setCurrentHeight(48),
                            width: setCurrentWidth(52),
                            color: appColor.whiteColor,
                            child: Center(
                              child: LinkedInIcon(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
