import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/icons/back_icon.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class AboutUsPage extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      backgroundColor: appColor.greyColor,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              heighSpacer(18),
              GestureDetector(
                onTap: () {
                  _navigationService.pop();
                },
                child: Container(
                  color: appColor.transparentColor,
                  child: Row(
                    children: [
                      widthSpacer(17),
                      BackIcon(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: setCurrentWidth(300),
              child: GlobalText(
                text:
                    "Tipr is a mobile application that allows customers to pay cashless tips directly to service workers using QR Code reader technology.",
                showEllipsis: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
