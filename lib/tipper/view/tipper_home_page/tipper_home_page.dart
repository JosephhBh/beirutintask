import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/constants/route_names.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/controller/provider/tipping_provider/tipping_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/icons/new_tip_icon.dart';

import 'package:tipperapp/widgets/icons/top_up_icon.dart';
import 'package:tipperapp/widgets/icons/user_icon.dart';
import 'package:tipperapp/widgets/icons/wallet_icon.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class TipperHomePage extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();
  var formatter = NumberFormat('#,##,000.00');
  NumberFormat numberFormat = NumberFormat.decimalPattern('hi');
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      backgroundColor: appColor.greyColor,
      child: Stack(
        fit: StackFit.loose,
        children: [
          applyPadding(
            137,
            37,
            37,
            0,
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(19),
                    child: Container(
                      height: setCurrentHeight(209),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: appColor.whiteColor,
                      ),
                      child: applyPadding(
                        8,
                        17,
                        0,
                        0,
                        Consumer<AuthenticationProvider>(
                            builder: (context, authenticationProvider, _) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                textBaseline: TextBaseline.ideographic,
                                children: [
                                  authenticationProvider
                                              .tipperModel.imagePath ==
                                          null
                                      ? UserIcon()
                                      : authenticationProvider
                                                  .tipperModel.imagePath ==
                                              ""
                                          ? UserIcon()
                                          : CircleAvatar(
                                              radius: setCurrentWidth(25),
                                              backgroundColor:
                                                  appColor.greyColor,
                                              backgroundImage: NetworkImage(
                                                  authenticationProvider
                                                      .tipperModel.imagePath!),
                                            ),
                                  widthSpacer(7),
                                  GlobalText(
                                    text: authenticationProvider
                                            .tipperModel.username ??
                                        "",
                                  ),
                                ],
                              ),
                              heighSpacer(39),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                textBaseline: TextBaseline.ideographic,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GlobalText(
                                    text: 'WALLET',
                                  ),
                                  widthSpacer(5),
                                  WalletIcon(),
                                ],
                              ),
                              heighSpacer(17),
                              GlobalText(
                                text: 'Current Balance',
                                isFredokaOne: false,
                                fontSize: 12,
                                isBold: true,
                              ),
                              heighSpacer(5),
                              GlobalText(
                                text: authenticationProvider
                                            .tipperModel.balance ==
                                        null
                                    ? ""
                                    : numberFormat.format(authenticationProvider
                                            .tipperModel.balance) +
                                        " AED",
                                isFredokaOne: false,
                                fontSize: 20,
                                isBold: true,
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                  heighSpacer(70),
                  Consumer<AuthenticationProvider>(
                      builder: (context, authenticationProvider, _) {
                    return GestureDetector(
                      onTap: () async {
                        // print(authenticationProvider.tipperModel.toJson());
                        if (authenticationProvider.tipperModel.balance! <
                            tippingAmount.first) {
                          _navigationService.navigateTo(name: kTopUpWalletPage);
                        } else {
                          var status = await Permission.camera.request();
                          print(status);
                          if (status.isPermanentlyDenied) {
                            openAppSettings();
                          } else if (status.isDenied) {
                            await Permission.camera.request();
                          } else if (status.isGranted) {
                            _navigationService.navigateTo(name: kQrPage);
                          }
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(19),
                        child: Container(
                          height: setCurrentHeight(110),
                          width: setCurrentWidth(140),
                          color: appColor.whiteColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              heighSpacer(20),
                              NewTipIcon(
                                height: 35,
                              ),
                              heighSpacer(7),
                              GlobalText(
                                text: 'Tip now',
                                fontSize: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  heighSpacer(83),
                  GestureDetector(
                    onTap: () async {
                      _navigationService.navigateTo(name: kTopUpWalletPage);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(19),
                      child: Container(
                        height: setCurrentHeight(110),
                        width: setCurrentWidth(140),
                        color: appColor.whiteColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            heighSpacer(20),
                            TopUpIcon(),
                            heighSpacer(7),
                            Container(
                              width: setCurrentWidth(100),
                              child: GlobalText(
                                text: 'Top up my wallet',
                                fontSize: 16,
                                showEllipsis: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
