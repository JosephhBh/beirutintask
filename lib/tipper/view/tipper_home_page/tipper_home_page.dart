import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/constants/route_names.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/controller/provider/tipping_provider/tipping_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/reciever/model/selected_receiver.dart';
import 'package:tipperapp/widgets/error_widgets/final_error_widget.dart';
import 'package:tipperapp/widgets/icons/new_tip_icon.dart';

import 'package:tipperapp/widgets/icons/top_up_icon.dart';
import 'package:tipperapp/widgets/icons/user_icon.dart';
import 'package:tipperapp/widgets/icons/wallet_icon.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class TipperHomePage extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();
  var formatter = NumberFormat('#,##,000.00');
  NumberFormat numberFormat = NumberFormat.decimalPattern('hi');
  @override
  Widget build(BuildContext context) {
    // var authenticationProvider =
    //     Provider.of<AuthenticationProvider>(context, listen: false);
    return GlobalScaffold(
      backgroundColor: appColor.greyColor,
      // child: Center(
      //   child: GestureDetector(
      //     onTap: () async {
      //       await authenticationProvider.signOut();
      //     },
      //     child: GlobalText(text: 'Sign out'),
      //   ),
      // ),
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
                      // color: appColor.whiteColor,
                      decoration: BoxDecoration(
                        color: appColor.whiteColor,
                        // border: Border.all(
                        //   width: 0.8,
                        //   color: appColor.dividerColor,
                        // ),
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
                                  UserIcon(),
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
                                // text: authenticationProvider.tipperModel.balance
                                //         .toString() +
                                //     " AED",
                                // text: formatter.format(authenticationProvider
                                //         .tipperModel.balance) +
                                //     " AED",
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
                        if (authenticationProvider.tipperModel.balance! <=
                            tippingAmount.first) {
                          _navigationService.navigateTo(name: kTopUpWallet);
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
                      _navigationService.navigateTo(name: kTopUpWallet);
                      // print(Get.width);
                      // print(setCurrentHeight(351));
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
