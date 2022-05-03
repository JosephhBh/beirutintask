import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/constants/route_names.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/buttons/logout_button.dart';
import 'package:tipperapp/widgets/containers/profile_selection_container.dart';
import 'package:tipperapp/widgets/icons/profile_icons/about_us_icon.dart';
import 'package:tipperapp/widgets/icons/profile_icons/home_icon.dart';
import 'package:tipperapp/widgets/icons/profile_icons/payment_methods_icon.dart';
import 'package:tipperapp/widgets/icons/profile_icons/personal_details_icon.dart';
import 'package:tipperapp/widgets/icons/profile_icons/profile_support_icon.dart';
import 'package:tipperapp/widgets/icons/profile_icons/settings_icon.dart';
import 'package:tipperapp/widgets/icons/profile_icons/transactions_icon.dart';
import 'package:tipperapp/widgets/icons/user_icon.dart';
import 'package:tipperapp/widgets/icons/wallet_icon.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class TipperProfilePage extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    // var authenticationProvier =
    //     Provider.of<AuthenticationProvider>(context, listen: false);

    return GlobalScaffold(
      backgroundColor: appColor.yellowColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<AuthenticationProvider>(
                builder: (context, authenticationProvider, _) {
              return Container(
                height: setCurrentHeight(280),
                width: double.infinity,
                color: appColor.greyColor,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      authenticationProvider.tipperModel.imagePath == null
                          ? UserIcon(
                              height: 105,
                            )
                          : authenticationProvider.tipperModel.imagePath == ""
                              ? UserIcon(
                                  height: 105,
                                )
                              : CircleAvatar(
                                  radius: setCurrentWidth(52),
                                  backgroundColor: appColor.greyColor,
                                  backgroundImage: NetworkImage(
                                      authenticationProvider
                                          .tipperModel.imagePath!),
                                ),
                      heighSpacer(9),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GlobalText(
                            text: authenticationProvider.tipperModel.username ??
                                "",
                            color: appColor.darkBlueColor,
                            fontSize: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
            heighSpacer(28),
            applyPadding(
              0,
              13,
              13,
              0,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  heighSpacer(11),
                  GestureDetector(
                    onTap: () {
                      _navigationService.navigateTo(
                          name: kTipperPersonalDetails);
                    },
                    child: ProfileSelectionContainer(
                      icon: PersonalDetailsIcon(),
                      text: "Personal details",
                    ),
                  ),
                  heighSpacer(16),

                  GestureDetector(
                    onTap: () {
                      _navigationService.navigateTo(
                          name: kTipperPaymentMethodPage);
                    },
                    child: ProfileSelectionContainer(
                      icon: PaymentMethodsIcon(),
                      text: "Payment methods",
                    ),
                  ),
                  heighSpacer(16),

                  GestureDetector(
                    onTap: () {
                      _navigationService.navigateTo(
                          name: kTipperAccountSettings);
                    },
                    child: ProfileSelectionContainer(
                      icon: SettingsIcon(),
                      text: "Account settings",
                    ),
                  ),
                  heighSpacer(16),

                  GestureDetector(
                    onTap: () {
                      _navigationService.navigateTo(name: kTipperTransactions);
                    },
                    child: ProfileSelectionContainer(
                      icon: TransactionsIcon(),
                      text: "Transactions",
                    ),
                  ),
                  heighSpacer(16),
                  // GestureDetector(
                  //   onTap: () {
                  //     _navigationService.navigateTo(name: kTipperWalletPage);
                  //   },
                  //   child: ProfileSelectionContainer(
                  //     icon: WalletIcon(),
                  //     text: "Wallet",
                  //   ),
                  // ),
                  // heighSpacer(16),
                  GestureDetector(
                    onTap: () {
                      _navigationService.navigateTo(name: kAboutUsPage);
                    },
                    child: ProfileSelectionContainer(
                      icon: AboutUsIcon(),
                      text: "About us",
                    ),
                  ),
                  // heighSpacer(18),
                  // ProfileSelectionContainer(
                  //   icon: ProfileSupportIcon(),
                  //   text: "Support",
                  // ),
                  heighSpacer(56),
                  Consumer<AuthenticationProvider>(
                      builder: (context, authenticationProvider, _) {
                    return LogoutButton(
                      onPressed: () async {
                        await authenticationProvider.signOut();
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
