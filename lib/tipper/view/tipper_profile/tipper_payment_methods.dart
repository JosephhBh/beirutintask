import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/constants/route_names.dart';
import 'package:tipperapp/core/controller/provider/payment_methods_provider/payment_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/icons/back_icon.dart';
import 'package:tipperapp/widgets/icons/payment_icons/apple_icon.dart';
import 'package:tipperapp/widgets/icons/payment_icons/check_circle.dart';
import 'package:tipperapp/widgets/icons/payment_icons/google_pay.dart';
import 'package:tipperapp/widgets/icons/payment_icons/hsbc_logo.dart';
import 'package:tipperapp/widgets/icons/payment_icons/master_card_icon.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class TipperPaymentMethods extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();
  var regex = new RegExp(r'[a-zA-Z-0-9]');
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      backgroundColor: appColor.greyColor,
      child: Stack(
        fit: StackFit.loose,
        children: [
          applyPadding(
            18,
            0,
            0,
            0,
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
          ),
          applyPadding(
            60,
            13,
            13,
            0,
            Consumer<PaymentProvider>(builder: (context, paymetnProvider, _) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    heighSpacer(27),
                    Row(
                      children: [
                        GlobalText(
                          text: 'Payment methods',
                          color: appColor.blackColor.withOpacity(0.66),
                        ),
                      ],
                    ),
                    heighSpacer(30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                errorMessageProvider.clearErrorMessage();
                                _navigationService.navigateTo(
                                    name: kTopUCardAccount);
                              },
                              child: GlobalText(
                                text: 'Edit',
                                color: appColor.yellowColor.withOpacity(0.66),
                                fontSize: 14,
                              ),
                            ),
                            widthSpacer(10),
                            Container(
                              height: setCurrentHeight(14),
                              child: VerticalDivider(
                                width: 1,
                                thickness: 1,
                                color: appColor.dividerColor,
                              ),
                            ),
                            widthSpacer(10),
                            GestureDetector(
                              onTap: () {
                                paymetnProvider.clearCardDetails();
                              },
                              child: GlobalText(
                                text: 'Delete',
                                color: appColor.blackColor.withOpacity(0.66),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        heighSpacer(8),
                        Container(
                          height: setCurrentHeight(63),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: appColor.whiteColor,
                            border: Border.all(
                              color: paymetnProvider.selectedPaymentMethod ==
                                      SelectedPaymentMethod.card
                                  ? appColor.yellowColor
                                  : appColor.transparentColor,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                widthSpacer(14),
                                MasterCardIcon(),
                                widthSpacer(14),
                                GlobalText(
                                  text: paymetnProvider
                                              .selectedPaymentDetailsModel
                                              .cardNumber ==
                                          ""
                                      ? "Visa card"
                                      : paymetnProvider
                                          .selectedPaymentDetailsModel
                                          .cardNumber!,
                                  color: appColor.blackColor.withOpacity(0.66),
                                  fontSize: 14,
                                ),
                                Spacer(),
                                paymetnProvider.selectedPaymentMethod ==
                                        SelectedPaymentMethod.card
                                    ? CheckCircleIcon()
                                    : SizedBox.shrink(),
                                widthSpacer(15),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    heighSpacer(22),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                errorMessageProvider.clearErrorMessage();
                                _navigationService.navigateTo(
                                    name: kTopUBankAccount);
                              },
                              child: GlobalText(
                                text: 'Edit',
                                color: appColor.yellowColor.withOpacity(0.66),
                                fontSize: 14,
                              ),
                            ),
                            widthSpacer(10),
                            Container(
                              height: setCurrentHeight(14),
                              child: VerticalDivider(
                                width: 1,
                                thickness: 1,
                                color: appColor.dividerColor,
                              ),
                            ),
                            widthSpacer(10),
                            GestureDetector(
                              onTap: () {
                                // paymetnProvider.deletePaymentMethod();
                                paymetnProvider.clearBankAccountDetails();
                              },
                              child: GlobalText(
                                text: 'Delete',
                                color: appColor.blackColor.withOpacity(0.66),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        heighSpacer(8),
                        Container(
                          height: setCurrentHeight(63),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: appColor.whiteColor,
                            border: Border.all(
                              color: paymetnProvider.selectedPaymentMethod ==
                                      SelectedPaymentMethod.card
                                  ? appColor.yellowColor
                                  : appColor.transparentColor,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                widthSpacer(14),
                                HSBCLogo(
                                  height: 63,
                                ),
                                widthSpacer(14),
                                GlobalText(
                                  text: paymetnProvider.isConfirmIbanPressed &&
                                          paymetnProvider
                                                  .ibanNumberController.text
                                                  .trim()
                                                  .length !=
                                              0
                                      ? paymetnProvider
                                          .ibanNumberController.text
                                          .replaceAll(regex, '*')
                                      : "Bank account",
                                  color: appColor.blackColor.withOpacity(0.66),
                                  fontSize: 14,
                                ),
                                Spacer(),
                                paymetnProvider.selectedPaymentMethod ==
                                        SelectedPaymentMethod.card
                                    ? CheckCircleIcon()
                                    : SizedBox.shrink(),
                                widthSpacer(15),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // heighSpacer(42),
                    // Container(
                    //   height: setCurrentHeight(63),
                    //   width: double.infinity,
                    //   color: appColor.transparentColor,
                    //   child: Stack(
                    //     fit: StackFit.loose,
                    //     children: [
                    //       Column(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Container(
                    //             height: setCurrentHeight(63),
                    //             width: double.infinity,
                    //             decoration: BoxDecoration(
                    //               color: appColor.whiteColor,
                    //               border: Border.all(
                    //                 color: appColor.transparentColor,
                    //                 width: 2,
                    //               ),
                    //             ),
                    //             child: Center(
                    //               child: Row(
                    //                 mainAxisAlignment: MainAxisAlignment.start,
                    //                 children: [
                    //                   widthSpacer(14),
                    //                   GooglePayIcon(
                    //                     height: 45,
                    //                   ),
                    //                   widthSpacer(28),
                    //                   GlobalText(
                    //                     text: "Google pay",
                    //                     color: appColor.blackColor
                    //                         .withOpacity(0.66),
                    //                     fontSize: 14,
                    //                   ),
                    //                   Spacer(),
                    //                   widthSpacer(15),
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // heighSpacer(42),
                    // Container(
                    //   height: setCurrentHeight(63),
                    //   width: double.infinity,
                    //   color: appColor.transparentColor,
                    //   child: Stack(
                    //     fit: StackFit.loose,
                    //     children: [
                    //       Column(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Container(
                    //             height: setCurrentHeight(63),
                    //             width: double.infinity,
                    //             decoration: BoxDecoration(
                    //               color: appColor.whiteColor,
                    //               border: Border.all(
                    //                 color: appColor.transparentColor,
                    //                 width: 2,
                    //               ),
                    //             ),
                    //             child: Center(
                    //               child: Row(
                    //                 mainAxisAlignment: MainAxisAlignment.start,
                    //                 children: [
                    //                   widthSpacer(14),
                    //                   ApplyPayeIcon(
                    //                     height: 45,
                    //                   ),
                    //                   widthSpacer(26),
                    //                   GlobalText(
                    //                     text: "Apple pay",
                    //                     color: appColor.blackColor
                    //                         .withOpacity(0.66),
                    //                     fontSize: 14,
                    //                   ),
                    //                   Spacer(),
                    //                   widthSpacer(15),
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Spacer(),
                    heighSpacer(470),
                    Container(
                      height: setCurrentHeight(63),
                      width: double.infinity,
                      color: appColor.yellowColor,
                      child: Center(
                        child: GlobalText(
                          text: "ADD PAYMENT METHOD",
                          fontSize: 22,
                          color: appColor.whiteColor,
                        ),
                      ),
                    ),
                    heighSpacer(40),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
