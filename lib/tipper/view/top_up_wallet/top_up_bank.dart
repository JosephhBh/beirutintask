import 'package:flutter/material.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/containers/payment_containers.dart';
import 'package:tipperapp/widgets/icons/back_icon.dart';
import 'package:tipperapp/widgets/icons/payment_icons/apple_icon.dart';
import 'package:tipperapp/widgets/icons/payment_icons/credit_card.dart';
import 'package:tipperapp/widgets/icons/payment_icons/google_pay.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class TopUpBank extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      backgroundColor: appColor.greyColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: setCurrentHeight(142),
              width: double.infinity,
              color: appColor.whiteColor,
              child: Stack(
                fit: StackFit.loose,
                children: [
                  applyPadding(
                    15,
                    13,
                    0,
                    0,
                    GestureDetector(
                      onTap: () {
                        _navigationService.pop();
                      },
                      child: Container(
                        color: appColor.transparentColor,
                        height: setCurrentHeight(70),
                        child: Row(
                          children: [
                            BackIcon(
                                // color: appColor.darkBlueColor,
                                ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  applyPadding(
                    15,
                    0,
                    0,
                    0,
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GlobalText(
                            text: 'tipr',
                            fontSize: 60,
                            color: appColor.yellowColor,
                          ),
                          heighSpacer(15),
                          GlobalText(
                            text: 'PAYMENT METHOD',
                            fontSize: 18,
                            color: appColor.darkBlueColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            applyPadding(
              22,
              42,
              42,
              0,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GlobalText(
                        text: 'Iban number',
                        fontSize: 16,
                        color: appColor.darkBlueColor.withOpacity(0.67),
                      ),
                    ],
                  ),
                  heighSpacer(8),
                  Container(
                    height: setCurrentHeight(50),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: appColor.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  heighSpacer(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GlobalText(
                        text: 'Card number',
                        fontSize: 16,
                        color: appColor.darkBlueColor.withOpacity(0.67),
                      ),
                    ],
                  ),
                  heighSpacer(8),
                  Container(
                    height: setCurrentHeight(50),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: appColor.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  heighSpacer(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GlobalText(
                                text: 'Expiry date',
                                fontSize: 16,
                                color: appColor.darkBlueColor.withOpacity(0.67),
                              ),
                            ],
                          ),
                          heighSpacer(8),
                          Container(
                            height: setCurrentHeight(50),
                            width: setCurrentWidth(180),
                            decoration: BoxDecoration(
                              color: appColor.whiteColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GlobalText(
                                text: 'CVV',
                                fontSize: 16,
                                color: appColor.darkBlueColor.withOpacity(0.67),
                              ),
                            ],
                          ),
                          heighSpacer(8),
                          Container(
                            height: setCurrentHeight(50),
                            width: setCurrentWidth(140),
                            decoration: BoxDecoration(
                              color: appColor.whiteColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  heighSpacer(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GlobalText(
                        text: "Card holder's name",
                        fontSize: 16,
                        color: appColor.darkBlueColor.withOpacity(0.67),
                      ),
                    ],
                  ),
                  heighSpacer(8),
                  Container(
                    height: setCurrentHeight(50),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: appColor.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  heighSpacer(23),
                  Container(
                    height: setCurrentHeight(48),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: appColor.yellowColor,
                      borderRadius: BorderRadius.circular(14),
                      // border: Border.all(
                      //   color: appColor.whiteColor,
                      //   width: 3,
                      // ),
                    ),
                    child: Center(
                      child: GlobalText(
                        text: "Confirm",
                        color: appColor.whiteColor,
                      ),
                    ),
                  ),
                  heighSpacer(15),
                  Row(
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Divider(
                          height: 1,
                          color: appColor.yellowColor,
                          thickness: 2.5,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GlobalText(
                              text: "Or pay with",
                              color: appColor.blackColor,
                              fontSize: 16,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Divider(
                          height: 1,
                          color: appColor.yellowColor,
                          thickness: 2.5,
                        ),
                      ),
                    ],
                  ),
                  heighSpacer(15),
                  PaymentContainer(
                    text: 'Credit cards',
                    icon: CreditCardIcon(),
                    height: 48,
                  ),
                  heighSpacer(15),
                  PaymentContainer(
                    text: 'Apple pay',
                    icon: ApplyPayeIcon(),
                    height: 48,
                  ),
                  heighSpacer(15),
                  PaymentContainer(
                    text: 'Google pay',
                    icon: GooglePayIcon(),
                    height: 48,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
