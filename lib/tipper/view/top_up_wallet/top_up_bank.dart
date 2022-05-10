import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/controller/provider/payment_methods_provider/payment_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/error_widgets/final_error_widget.dart';
import 'package:tipperapp/widgets/icons/back_icon.dart';
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
                              text: "Bank account holder name",
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
                                        .bankAccountHolderController,
                                    onChanged: (String value) {
                                      // if (value.length <= 2) {
                                      //   paymetnProvider.setIsNameValid(false);
                                      // } else {
                                      //   paymetnProvider.setIsNameValid(true);
                                      // }
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
                              text: 'IBAN number',
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
                                        paymetnProvider.ibanNumberController,
                                    onChanged: (String value) {
                                      // if (value.length > 0 &&
                                      //     value.replaceAll(" ", '').length <
                                      //         16) {
                                      //   paymetnProvider.setIsCardValid(false);
                                      // } else {
                                      //   paymetnProvider.setIsCardValid(true);
                                      // }
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

                        // heighSpacer(30),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     GlobalText(
                        //       text: "Amount",
                        //       fontSize: 16,
                        //       color: appColor.darkBlueColor.withOpacity(0.67),
                        //     ),
                        //   ],
                        // ),
                        // heighSpacer(8),
                        // Container(
                        //   height: setCurrentHeight(50),
                        //   width: double.infinity,
                        //   decoration: BoxDecoration(
                        //     color: appColor.whiteColor,
                        //     borderRadius: BorderRadius.circular(12),
                        //   ),
                        //   child: Center(
                        //     child: Row(
                        //       children: [
                        //         Expanded(
                        //           flex: 1,
                        //           child: TextField(
                        //             controller:
                        //                 paymetnProvider.amountController,
                        //             onChanged: (String value) {
                        //               if (value.length < 1) {
                        //                 paymetnProvider.setIsAmountValid(false);
                        //               } else {
                        //                 paymetnProvider.setIsAmountValid(true);
                        //               }
                        //             },
                        //             style: GoogleFonts.fredokaOne(
                        //               color: appColor.blackColor,
                        //               fontSize: setFontSize(18),
                        //             ),
                        //             textInputAction: TextInputAction.next,
                        //             keyboardType: TextInputType.number,
                        //             cursorColor: appColor.blackColor,
                        //             decoration: InputDecoration(
                        //               // hintText: "01-24",
                        //               alignLabelWithHint: false,
                        //               contentPadding: EdgeInsets.fromLTRB(
                        //                   setCurrentWidth(16),
                        //                   setCurrentHeight(8),
                        //                   8,
                        //                   12),
                        //               fillColor: appColor.transparentColor,
                        //               filled: true,
                        //               enabledBorder: OutlineInputBorder(
                        //                 borderSide: BorderSide(
                        //                   color: Colors.transparent,
                        //                 ),
                        //                 borderRadius: BorderRadius.circular(9),
                        //               ),
                        //               hintStyle: GoogleFonts.fredokaOne(
                        //                 color: appColor.blackColor
                        //                     .withOpacity(0.2),
                        //                 fontSize: setFontSize(16),
                        //               ),
                        //               focusedBorder: OutlineInputBorder(
                        //                 borderSide: BorderSide(
                        //                   color: Colors.transparent,
                        //                 ),
                        //                 borderRadius: BorderRadius.circular(8),
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        heighSpacer(120),
                        GestureDetector(
                          onTap: () {
                            paymetnProvider.updateBankAccountDetails();
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
                        // Row(
                        //   textBaseline: TextBaseline.ideographic,
                        //   children: [
                        //     Expanded(
                        //       flex: 1,
                        //       child: Divider(
                        //         height: 1,
                        //         color: appColor.yellowColor,
                        //         thickness: 2.5,
                        //       ),
                        //     ),
                        //     Expanded(
                        //       flex: 1,
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           GlobalText(
                        //             text: "Or pay with",
                        //             color: appColor.blackColor,
                        //             fontSize: 16,
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     Expanded(
                        //       flex: 1,
                        //       child: Divider(
                        //         height: 1,
                        //         color: appColor.yellowColor,
                        //         thickness: 2.5,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // heighSpacer(15),
                        // PaymentContainer(
                        //   text: 'Apple pay',
                        //   icon: ApplyPayeIcon(),
                        //   height: 48,
                        // ),
                        // heighSpacer(15),
                        // PaymentContainer(
                        //   text: 'Google pay',
                        //   icon: GooglePayIcon(),
                        //   height: 48,
                        // ),
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
