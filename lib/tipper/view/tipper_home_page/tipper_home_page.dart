import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/constants/route_names.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/icons/tip_icon.dart';
import 'package:tipperapp/widgets/icons/top_up_icon.dart';
import 'package:tipperapp/widgets/icons/user_icon.dart';
import 'package:tipperapp/widgets/icons/wallet_icon.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class TipperHomePage extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    var authenticationProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: setCurrentHeight(209),
                  width: double.infinity,
                  color: appColor.whiteColor,
                  child: applyPadding(
                    8,
                    17,
                    0,
                    0,
                    Column(
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
                              text:
                                  authenticationProvider.tipperModel.username!,
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
                          text: authenticationProvider.tipperModel.balance
                                  .toString() +
                              " AED",
                          isFredokaOne: false,
                          fontSize: 20,
                          isBold: true,
                        ),
                      ],
                    ),
                  ),
                ),
                heighSpacer(70),
                GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(19),
                    child: Container(
                      height: setCurrentHeight(92),
                      width: setCurrentWidth(140),
                      color: appColor.whiteColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TipIcon(),
                          heighSpacer(11),
                          GlobalText(
                            text: 'Tip now',
                            fontSize: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                heighSpacer(83),
                GestureDetector(
                  onTap: () {
                    _navigationService.navigateTo(name: kTopUpWallet);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(19),
                    child: Container(
                      height: setCurrentHeight(92),
                      width: setCurrentWidth(140),
                      color: appColor.whiteColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TopUpIcon(),
                          heighSpacer(11),
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
        ],
      ),
    );
  }
}
