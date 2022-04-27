import 'package:flutter/material.dart';
import 'package:tipperapp/core/constants/route_names.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/containers/payment_containers.dart';
import 'package:tipperapp/widgets/icons/back_icon.dart';
import 'package:tipperapp/widgets/icons/payment_icons/apple_icon.dart';
import 'package:tipperapp/widgets/icons/payment_icons/background_image.dart';
import 'package:tipperapp/widgets/icons/payment_icons/bank_icon.dart';
import 'package:tipperapp/widgets/icons/payment_icons/credit_card.dart';
import 'package:tipperapp/widgets/icons/payment_icons/google_pay.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class TopUpWallet extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      backgroundColor: appColor.greyColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          // fit: StackFit.loose,
          children: [
            Container(
              height: setCurrentHeight(299),
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
                    62,
                    0,
                    0,
                    0,
                    Align(
                      alignment: Alignment.topCenter,
                      child: GlobalText(
                        text: 'TOP UP MY WALLET',
                        isBold: true,
                        isFredokaOne: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: appColor.transparentColor,
                      child: PaymentBackgroundImage(),
                    ),
                  ),
                ],
              ),
            ),
            applyPadding(
              25,
              28,
              28,
              0,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalText(
                    text: 'Top up:',
                    isFredokaOne: false,
                  ),
                  heighSpacer(31),
                  GestureDetector(
                    onTap: () {
                      _navigationService.navigateTo(name: kTopUpBankAccount);
                    },
                    child: Container(
                      height: setCurrentHeight(76),
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
                                child: BankAccountIcon(),
                              ),
                            ),
                            widthSpacer(8),
                            GlobalText(
                              text: 'Top up using my bank account',
                              fontSize: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  heighSpacer(32),
                  GlobalText(
                    text: 'Top up using:',
                    isFredokaOne: false,
                  ),
                  heighSpacer(32),
                  PaymentContainer(
                    text: 'Credit cards',
                    icon: CreditCardIcon(),
                  ),
                  heighSpacer(21),
                  PaymentContainer(
                    text: 'Apple pay',
                    icon: ApplyPayeIcon(),
                  ),
                  heighSpacer(21),
                  PaymentContainer(
                    text: 'Google pay',
                    icon: GooglePayIcon(),
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
