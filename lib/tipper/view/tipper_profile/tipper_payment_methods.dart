import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/constants/route_names.dart';
import 'package:tipperapp/core/controller/provider/payment_methods_provider/payment_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/containers/payment_containers.dart';
import 'package:tipperapp/widgets/error_widgets/final_error_widget.dart';
import 'package:tipperapp/widgets/icons/back_icon.dart';
import 'package:tipperapp/widgets/icons/payment_icons/apple_icon.dart';
import 'package:tipperapp/widgets/icons/payment_icons/apple_pay_logo.dart';
import 'package:tipperapp/widgets/icons/payment_icons/check_circle.dart';
import 'package:tipperapp/widgets/icons/payment_icons/credit_card.dart';
import 'package:tipperapp/widgets/icons/payment_icons/google_pay.dart';
import 'package:tipperapp/widgets/icons/payment_icons/google_pay_logo.dart';
import 'package:tipperapp/widgets/icons/payment_icons/master_card_icon.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class TipperPaymenMethods extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heighSpacer(50),
                    Row(
                      children: [
                        widthSpacer(5),
                        GlobalText(
                          text: 'Payment Methods',
                          color: appColor.blackColor.withOpacity(0.66),
                        ),
                      ],
                    ),
                    heighSpacer(27),
                    paymetnProvider.selectedPaymentMethod ==
                            SelectedPaymentMethod.none
                        ? Container(
                            height: setCurrentHeight(112),
                            width: double.infinity,
                            color: appColor.transparentColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GlobalText(
                                      text: 'Current Method',
                                      color:
                                          appColor.blackColor.withOpacity(0.66),
                                      fontSize: 16,
                                    ),
                                  ],
                                ),
                                heighSpacer(30),
                                GlobalText(
                                  text: 'No selected payment method',
                                  color: appColor.blackColor.withOpacity(0.66),
                                  fontSize: 16,
                                ),
                              ],
                            ),
                          )
                        : paymetnProvider.selectedPaymentMethod ==
                                SelectedPaymentMethod.apple
                            ? Container(
                                height: setCurrentHeight(112),
                                width: double.infinity,
                                child: Stack(
                                  fit: StackFit.loose,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        GlobalText(
                                          text: 'Current Method',
                                          color: appColor.blackColor
                                              .withOpacity(0.66),
                                          fontSize: 16,
                                        ),
                                      ],
                                    ),
                                    applyPadding(
                                      7,
                                      0,
                                      0,
                                      0,
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                onTap: () {},
                                                child: GlobalText(
                                                  text: 'Edit',
                                                  color: appColor.blackColor
                                                      .withOpacity(0.66),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: setCurrentHeight(63),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: appColor.whiteColor,
                                              border: Border.all(
                                                color: appColor.yellowColor,
                                                width: 2,
                                              ),
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  widthSpacer(14),
                                                  ApplePayLogo(),
                                                  widthSpacer(14),
                                                  Spacer(),
                                                  CheckCircleIcon(),
                                                  widthSpacer(15),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              GlobalText(
                                                text: 'Delete',
                                                color: appColor.blackColor
                                                    .withOpacity(0.66),
                                                fontSize: 14,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : paymetnProvider.selectedPaymentMethod ==
                                    SelectedPaymentMethod.google
                                ? Container(
                                    height: setCurrentHeight(112),
                                    width: double.infinity,
                                    child: Stack(
                                      fit: StackFit.loose,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            GlobalText(
                                              text: 'Current Method',
                                              color: appColor.blackColor
                                                  .withOpacity(0.66),
                                              fontSize: 16,
                                            ),
                                          ],
                                        ),
                                        applyPadding(
                                          7,
                                          0,
                                          0,
                                          0,
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: GlobalText(
                                                      text: 'Edit',
                                                      color: appColor.blackColor
                                                          .withOpacity(0.66),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: setCurrentHeight(63),
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: appColor.whiteColor,
                                                  border: Border.all(
                                                    color: appColor.yellowColor,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      widthSpacer(14),
                                                      GooglePayLogo(),
                                                      widthSpacer(14),
                                                      Spacer(),
                                                      CheckCircleIcon(),
                                                      widthSpacer(15),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  GlobalText(
                                                    text: 'Delete',
                                                    color: appColor.blackColor
                                                        .withOpacity(0.66),
                                                    fontSize: 14,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(
                                    height: setCurrentHeight(112),
                                    width: double.infinity,
                                    color: appColor.transparentColor,
                                    child: Stack(
                                      fit: StackFit.loose,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            GlobalText(
                                              text: 'Current Method',
                                              color: appColor.blackColor
                                                  .withOpacity(0.66),
                                              fontSize: 16,
                                            ),
                                          ],
                                        ),
                                        applyPadding(
                                          7,
                                          0,
                                          0,
                                          0,
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      _navigationService.navigateTo(
                                                          name:
                                                              kTopUpBankAccount);
                                                    },
                                                    child: GlobalText(
                                                      text: 'Edit',
                                                      color: appColor.blackColor
                                                          .withOpacity(0.66),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: setCurrentHeight(63),
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: appColor.whiteColor,
                                                  border: Border.all(
                                                    color: appColor.yellowColor,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      widthSpacer(14),
                                                      MasterCardIcon(),
                                                      widthSpacer(14),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          GlobalText(
                                                            text: paymetnProvider
                                                                .selectedPaymentDetailsModel
                                                                .cardNumber!,
                                                            color: appColor
                                                                .blackColor
                                                                .withOpacity(
                                                                    0.66),
                                                            fontSize: 14,
                                                          ),
                                                          GlobalText(
                                                            text: paymetnProvider
                                                                .selectedPaymentDetailsModel
                                                                .exipryDate!,
                                                            color: appColor
                                                                .blackColor
                                                                .withOpacity(
                                                                    0.5),
                                                            fontSize: 14,
                                                          ),
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      CheckCircleIcon(),
                                                      widthSpacer(15),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  GlobalText(
                                                    text: 'Delete',
                                                    color: appColor.blackColor
                                                        .withOpacity(0.66),
                                                    fontSize: 14,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                    heighSpacer(51),
                    Row(
                      children: [
                        widthSpacer(5),
                        GlobalText(
                          text: 'Add other payment methods',
                          color: appColor.blackColor.withOpacity(0.66),
                        ),
                      ],
                    ),
                    heighSpacer(52),
                    GestureDetector(
                      onTap: () {
                        paymetnProvider.setCardPaymentMethod();
                      },
                      child: PaymentContainer(
                        text: 'Credit cards',
                        icon: CreditCardIcon(),
                        height: 76,
                        isSelected: paymetnProvider.selectedPaymentMethod ==
                            SelectedPaymentMethod.card,
                      ),
                    ),
                    heighSpacer(21),
                    GestureDetector(
                      onTap: () {
                        paymetnProvider.setAppltPaymentMethod();
                      },
                      child: PaymentContainer(
                        text: 'Apple pay',
                        icon: ApplyPayeIcon(),
                        height: 76,
                        isSelected: paymetnProvider.selectedPaymentMethod ==
                            SelectedPaymentMethod.apple,
                      ),
                    ),
                    heighSpacer(21),
                    GestureDetector(
                      onTap: () {
                        paymetnProvider.setGooglePaymentMethod();
                      },
                      child: PaymentContainer(
                        text: 'Google pay',
                        icon: GooglePayIcon(),
                        height: 76,
                        isSelected: paymetnProvider.selectedPaymentMethod ==
                            SelectedPaymentMethod.google,
                      ),
                    ),
                    heighSpacer(118),
                    GestureDetector(
                      onTap: () {
                        if (paymetnProvider.selectedPaymentMethod ==
                            SelectedPaymentMethod.none) {
                          errorMessageProvider.setErrorMessage(
                              message: "Select payment method");
                        } else {
                          errorMessageProvider.clearErrorMessage();
                          _navigationService.navigateTo(
                              name: kTopUpBankAccount);
                        }
                      },
                      child: Container(
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
                    ),
                  ],
                ),
              );
            }),
          ),
          FinalErrorWidget(),
        ],
      ),
    );
  }
}
