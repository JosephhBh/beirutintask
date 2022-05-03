// import 'package:flutter/material.dart';
// import 'package:tipperapp/core/device_utils/device_utils.dart';
// import 'package:tipperapp/core/navigation/navigation_service.dart';
// import 'package:tipperapp/locator.dart';
// import 'package:tipperapp/widgets/containers/payment_containers.dart';
// import 'package:tipperapp/widgets/icons/back_icon.dart';
// import 'package:tipperapp/widgets/icons/payment_icons/apple_icon.dart';
// import 'package:tipperapp/widgets/icons/payment_icons/credit_card.dart';
// import 'package:tipperapp/widgets/icons/payment_icons/google_pay.dart';
// import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
// import 'package:tipperapp/widgets/text/global_text.dart';

// class TopUpBank extends StatelessWidget {
//   final NavigationService _navigationService = locator<NavigationService>();
//   @override
//   Widget build(BuildContext context) {
//     return GlobalScaffold(
//       backgroundColor: appColor.greyColor,
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               height: setCurrentHeight(142),
//               width: double.infinity,
//               color: appColor.whiteColor,
//               child: Stack(
//                 fit: StackFit.loose,
//                 children: [
//                   applyPadding(
//                     15,
//                     13,
//                     0,
//                     0,
//                     GestureDetector(
//                       onTap: () {
//                         _navigationService.pop();
//                       },
//                       child: Container(
//                         color: appColor.transparentColor,
//                         height: setCurrentHeight(70),
//                         child: Row(
//                           children: [
//                             BackIcon(
//                                 // color: appColor.darkBlueColor,
//                                 ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   applyPadding(
//                     15,
//                     0,
//                     0,
//                     0,
//                     Align(
//                       alignment: Alignment.topCenter,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           GlobalText(
//                             text: 'tipr',
//                             fontSize: 60,
//                             color: appColor.yellowColor,
//                           ),
//                           heighSpacer(15),
//                           GlobalText(
//                             text: 'PAYMENT METHOD',
//                             fontSize: 18,
//                             color: appColor.darkBlueColor,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             applyPadding(
//               22,
//               42,
//               42,
//               0,
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       GlobalText(
//                         text: 'Iban number',
//                         fontSize: 16,
//                         color: appColor.darkBlueColor.withOpacity(0.67),
//                       ),
//                     ],
//                   ),
//                   heighSpacer(8),
//                   Container(
//                     height: setCurrentHeight(50),
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: appColor.whiteColor,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   heighSpacer(30),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       GlobalText(
//                         text: 'Card number',
//                         fontSize: 16,
//                         color: appColor.darkBlueColor.withOpacity(0.67),
//                       ),
//                     ],
//                   ),
//                   heighSpacer(8),
//                   Container(
//                     height: setCurrentHeight(50),
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: appColor.whiteColor,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   heighSpacer(30),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               GlobalText(
//                                 text: 'Expiry date',
//                                 fontSize: 16,
//                                 color: appColor.darkBlueColor.withOpacity(0.67),
//                               ),
//                             ],
//                           ),
//                           heighSpacer(8),
//                           Container(
//                             height: setCurrentHeight(50),
//                             width: setCurrentWidth(180),
//                             decoration: BoxDecoration(
//                               color: appColor.whiteColor,
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Spacer(),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               GlobalText(
//                                 text: 'CVV',
//                                 fontSize: 16,
//                                 color: appColor.darkBlueColor.withOpacity(0.67),
//                               ),
//                             ],
//                           ),
//                           heighSpacer(8),
//                           Container(
//                             height: setCurrentHeight(50),
//                             width: setCurrentWidth(140),
//                             decoration: BoxDecoration(
//                               color: appColor.whiteColor,
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   heighSpacer(30),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       GlobalText(
//                         text: "Card holder's name",
//                         fontSize: 16,
//                         color: appColor.darkBlueColor.withOpacity(0.67),
//                       ),
//                     ],
//                   ),
//                   heighSpacer(8),
//                   Container(
//                     height: setCurrentHeight(50),
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: appColor.whiteColor,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   heighSpacer(23),
//                   Container(
//                     height: setCurrentHeight(48),
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: appColor.yellowColor,
//                       borderRadius: BorderRadius.circular(14),
//                       // border: Border.all(
//                       //   color: appColor.whiteColor,
//                       //   width: 3,
//                       // ),
//                     ),
//                     child: Center(
//                       child: GlobalText(
//                         text: "Confirm",
//                         color: appColor.whiteColor,
//                       ),
//                     ),
//                   ),
//                   heighSpacer(15),
//                   Row(
//                     textBaseline: TextBaseline.ideographic,
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: Divider(
//                           height: 1,
//                           color: appColor.yellowColor,
//                           thickness: 2.5,
//                         ),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             GlobalText(
//                               text: "Or pay with",
//                               color: appColor.blackColor,
//                               fontSize: 16,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: Divider(
//                           height: 1,
//                           color: appColor.yellowColor,
//                           thickness: 2.5,
//                         ),
//                       ),
//                     ],
//                   ),
//                   heighSpacer(15),
//                   PaymentContainer(
//                     text: 'Credit cards',
//                     icon: CreditCardIcon(),
//                     height: 48,
//                   ),
//                   heighSpacer(15),
//                   PaymentContainer(
//                     text: 'Apple pay',
//                     icon: ApplyPayeIcon(),
//                     height: 48,
//                   ),
//                   heighSpacer(15),
//                   PaymentContainer(
//                     text: 'Google pay',
//                     icon: GooglePayIcon(),
//                     height: 48,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/controller/provider/payment_methods_provider/payment_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/containers/payment_containers.dart';
import 'package:tipperapp/widgets/error_widgets/final_error_widget.dart';
import 'package:tipperapp/widgets/icons/back_icon.dart';
import 'package:tipperapp/widgets/icons/payment_icons/apple_icon.dart';
import 'package:tipperapp/widgets/icons/payment_icons/credit_card.dart';
import 'package:tipperapp/widgets/icons/payment_icons/google_pay.dart';
import 'package:tipperapp/widgets/loading/global_loading.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class TopUpBank extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    var authenticationProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return GlobalScaffold(
      backgroundColor: appColor.greyColor,
      child: SingleChildScrollView(
        child: Stack(
          fit: StackFit.loose,
          children: [
            Column(
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
                  Consumer<PaymentProvider>(
                      builder: (context, paymetnProvider, _) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          child: Center(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    controller: paymetnProvider
                                        .cardHolderNameController,
                                    onChanged: (String value) {
                                      if (value.length <= 2) {
                                        paymetnProvider.setIsNameValid(false);
                                      } else {
                                        paymetnProvider.setIsNameValid(true);
                                      }
                                    },
                                    style: GoogleFonts.fredokaOne(
                                      color: appColor.blackColor,
                                      fontSize: setFontSize(18),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.name,
                                    cursorColor: appColor.blackColor,
                                    decoration: InputDecoration(
                                      alignLabelWithHint: false,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          setCurrentWidth(16),
                                          setCurrentHeight(8),
                                          8,
                                          12),
                                      fillColor: appColor.transparentColor,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      hintStyle: GoogleFonts.fredokaOne(
                                        color: appColor.blackColor
                                            .withOpacity(0.6),
                                        fontSize: setFontSize(16),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                          child: Center(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    controller:
                                        paymetnProvider.cardNumberController,
                                    onChanged: (String value) {
                                      if (value.length > 0 &&
                                          value.replaceAll(" ", '').length <
                                              16) {
                                        paymetnProvider.setIsCardValid(false);
                                      } else {
                                        paymetnProvider.setIsCardValid(true);
                                      }
                                    },
                                    style: GoogleFonts.fredokaOne(
                                      color: appColor.blackColor,
                                      fontSize: setFontSize(18),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    cursorColor: appColor.blackColor,
                                    decoration: InputDecoration(
                                      alignLabelWithHint: false,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          setCurrentWidth(16),
                                          setCurrentHeight(8),
                                          8,
                                          12),
                                      fillColor: appColor.transparentColor,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      hintStyle: GoogleFonts.fredokaOne(
                                        color: appColor.blackColor
                                            .withOpacity(0.6),
                                        fontSize: setFontSize(16),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                                      color: appColor.darkBlueColor
                                          .withOpacity(0.67),
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
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: TextField(
                                            controller: paymetnProvider
                                                .expiryDateController,
                                            onChanged: (String value) {
                                              if (value.length < 4) {
                                                paymetnProvider
                                                    .setIsDateValid(false);
                                              } else {
                                                paymetnProvider
                                                    .setIsDateValid(true);
                                              }
                                            },
                                            style: GoogleFonts.fredokaOne(
                                              color: appColor.blackColor,
                                              fontSize: setFontSize(18),
                                            ),
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType: TextInputType.number,
                                            cursorColor: appColor.blackColor,
                                            decoration: InputDecoration(
                                              hintText: "05 / 2023",
                                              alignLabelWithHint: false,
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      setCurrentWidth(16),
                                                      setCurrentHeight(8),
                                                      8,
                                                      12),
                                              fillColor:
                                                  appColor.transparentColor,
                                              filled: true,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                              ),
                                              hintStyle: GoogleFonts.fredokaOne(
                                                color: appColor.blackColor
                                                    .withOpacity(0.2),
                                                fontSize: setFontSize(16),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
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
                                      color: appColor.darkBlueColor
                                          .withOpacity(0.67),
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
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: TextField(
                                            controller:
                                                paymetnProvider.cvcController,
                                            onChanged: (String value) {
                                              if (value.length < 2) {
                                                paymetnProvider
                                                    .setIsCVCValid(false);
                                              } else {
                                                paymetnProvider
                                                    .setIsCVCValid(true);
                                              }
                                            },
                                            style: GoogleFonts.fredokaOne(
                                              color: appColor.blackColor,
                                              fontSize: setFontSize(18),
                                            ),
                                            textInputAction:
                                                TextInputAction.next,
                                            keyboardType: TextInputType.number,
                                            cursorColor: appColor.blackColor,
                                            decoration: InputDecoration(
                                              // hintText: "01-24",
                                              alignLabelWithHint: false,
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      setCurrentWidth(16),
                                                      setCurrentHeight(8),
                                                      8,
                                                      12),
                                              fillColor:
                                                  appColor.transparentColor,
                                              filled: true,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(9),
                                              ),
                                              hintStyle: GoogleFonts.fredokaOne(
                                                color: appColor.blackColor
                                                    .withOpacity(0.2),
                                                fontSize: setFontSize(16),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
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
                          ],
                        ),
                        heighSpacer(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GlobalText(
                              text: "Amount",
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
                          child: Center(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextField(
                                    controller:
                                        paymetnProvider.amountController,
                                    onChanged: (String value) {
                                      if (value.length < 1) {
                                        paymetnProvider.setIsAmountValid(false);
                                      } else {
                                        paymetnProvider.setIsAmountValid(true);
                                      }
                                    },
                                    style: GoogleFonts.fredokaOne(
                                      color: appColor.blackColor,
                                      fontSize: setFontSize(18),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    cursorColor: appColor.blackColor,
                                    decoration: InputDecoration(
                                      // hintText: "01-24",
                                      alignLabelWithHint: false,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          setCurrentWidth(16),
                                          setCurrentHeight(8),
                                          8,
                                          12),
                                      fillColor: appColor.transparentColor,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      hintStyle: GoogleFonts.fredokaOne(
                                        color: appColor.blackColor
                                            .withOpacity(0.2),
                                        fontSize: setFontSize(16),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        heighSpacer(23),
                        GestureDetector(
                          onTap: () async {
                            await paymetnProvider.updateAmount(context);
                          },
                          child: Container(
                            height: setCurrentHeight(48),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: appColor.yellowColor,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Center(
                              child: GlobalText(
                                text: "Confirm",
                                color: appColor.whiteColor,
                              ),
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
                    );
                  }),
                ),
              ],
            ),
            FinalErrorWidget(),
            Consumer<PaymentProvider>(builder: (context, paymenProvider, _) {
              return paymenProvider.isLoading
                  ? GlobalLoading()
                  : SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}
