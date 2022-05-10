// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:tipperapp/core/constants/route_names.dart';
// import 'package:tipperapp/core/controller/provider/payment_methods_provider/payment_provider.dart';
// import 'package:tipperapp/core/device_utils/device_utils.dart';
// import 'package:tipperapp/core/navigation/navigation_service.dart';
// import 'package:tipperapp/locator.dart';
// import 'package:tipperapp/widgets/containers/payment_containers.dart';
// import 'package:tipperapp/widgets/error_widgets/final_error_widget.dart';
// import 'package:tipperapp/widgets/icons/back_icon.dart';
// import 'package:tipperapp/widgets/icons/payment_icons/apple_icon.dart';
// import 'package:tipperapp/widgets/icons/payment_icons/apple_pay_logo.dart';
// import 'package:tipperapp/widgets/icons/payment_icons/check_circle.dart';
// import 'package:tipperapp/widgets/icons/payment_icons/credit_card.dart';
// import 'package:tipperapp/widgets/icons/payment_icons/google_pay.dart';
// import 'package:tipperapp/widgets/icons/payment_icons/google_pay_logo.dart';
// import 'package:tipperapp/widgets/icons/payment_icons/master_card_icon.dart';
// import 'package:tipperapp/widgets/loading/global_loading.dart';
// import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
// import 'package:tipperapp/widgets/text/global_text.dart';

// class TipperPaymenMethods extends StatelessWidget {
//   final NavigationService _navigationService = locator<NavigationService>();
//   @override
//   Widget build(BuildContext context) {
//     return GlobalScaffold(
//       backgroundColor: appColor.greyColor,
//       child: Stack(
//         fit: StackFit.loose,
//         children: [
//           applyPadding(
//             18,
//             0,
//             0,
//             0,
//             GestureDetector(
//               onTap: () {
//                 _navigationService.pop();
//               },
//               child: Container(
//                 color: appColor.transparentColor,
//                 child: Row(
//                   children: [
//                     widthSpacer(17),
//                     BackIcon(),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           applyPadding(
//             60,
//             13,
//             13,
//             0,
//             Consumer<PaymentProvider>(builder: (context, paymetnProvider, _) {
//               return SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     heighSpacer(13),
//                     Row(
//                       children: [
//                         // widthSpacer(5),
//                         GlobalText(
//                           text: 'Payment methods',
//                           color: appColor.blackColor.withOpacity(0.66),
//                         ),
//                       ],
//                     ),
//                     heighSpacer(27),
//                     paymetnProvider.selectedPaymentMethod ==
//                             SelectedPaymentMethod.none
//                         ? Container(
//                             height: setCurrentHeight(112),
//                             width: double.infinity,
//                             color: appColor.transparentColor,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     GlobalText(
//                                       text: 'Current method',
//                                       color:
//                                           appColor.blackColor.withOpacity(0.66),
//                                       fontSize: 16,
//                                     ),
//                                   ],
//                                 ),
//                                 heighSpacer(30),
//                                 GlobalText(
//                                   text: 'No selected payment method',
//                                   color: appColor.blackColor.withOpacity(0.66),
//                                   fontSize: 16,
//                                 ),
//                               ],
//                             ),
//                           )
//                         : paymetnProvider.selectedPaymentMethod ==
//                                 SelectedPaymentMethod.apple
//                             ? Container(
//                                 height: setCurrentHeight(112),
//                                 width: double.infinity,
//                                 child: Stack(
//                                   fit: StackFit.loose,
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         GlobalText(
//                                           text: 'Current method',
//                                           color: appColor.blackColor
//                                               .withOpacity(0.66),
//                                           fontSize: 16,
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.end,
//                                           children: [
//                                             GestureDetector(
//                                               onTap: () {},
//                                               child: GlobalText(
//                                                 text: 'Edit',
//                                                 color: appColor.yellowColor
//                                                     .withOpacity(0.66),
//                                                 fontSize: 14,
//                                               ),
//                                             ),
//                                             widthSpacer(10),
//                                             Container(
//                                               height: setCurrentHeight(14),
//                                               child: VerticalDivider(
//                                                 width: 1,
//                                                 thickness: 1,
//                                                 color: appColor.dividerColor,
//                                               ),
//                                             ),
//                                             widthSpacer(10),
//                                             GestureDetector(
//                                               onTap: () {
//                                                 paymetnProvider
//                                                     .deletePaymentMethod();
//                                               },
//                                               child: GlobalText(
//                                                 text: 'Delete',
//                                                 color: appColor.blackColor
//                                                     .withOpacity(0.66),
//                                                 fontSize: 14,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         heighSpacer(8),
//                                         Container(
//                                           height: setCurrentHeight(63),
//                                           width: double.infinity,
//                                           decoration: BoxDecoration(
//                                             color: appColor.whiteColor,
//                                             border: Border.all(
//                                               color: appColor.yellowColor,
//                                               width: 2,
//                                             ),
//                                           ),
//                                           child: Center(
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               children: [
//                                                 widthSpacer(14),
//                                                 ApplePayLogo(),
//                                                 widthSpacer(14),
//                                                 Spacer(),
//                                                 CheckCircleIcon(),
//                                                 widthSpacer(15),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             : paymetnProvider.selectedPaymentMethod ==
//                                     SelectedPaymentMethod.google
//                                 ? Container(
//                                     height: setCurrentHeight(112),
//                                     width: double.infinity,
//                                     child: Stack(
//                                       fit: StackFit.loose,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           children: [
//                                             GlobalText(
//                                               text: 'Current method',
//                                               color: appColor.blackColor
//                                                   .withOpacity(0.66),
//                                               fontSize: 16,
//                                             ),
//                                           ],
//                                         ),
//                                         Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.end,
//                                               children: [
//                                                 GestureDetector(
//                                                   onTap: () {},
//                                                   child: GlobalText(
//                                                     text: 'Edit',
//                                                     color: appColor.yellowColor
//                                                         .withOpacity(0.66),
//                                                     fontSize: 14,
//                                                   ),
//                                                 ),
//                                                 widthSpacer(10),
//                                                 Container(
//                                                   height: setCurrentHeight(14),
//                                                   child: VerticalDivider(
//                                                     width: 1,
//                                                     thickness: 1,
//                                                     color:
//                                                         appColor.dividerColor,
//                                                   ),
//                                                 ),
//                                                 widthSpacer(10),
//                                                 GestureDetector(
//                                                   onTap: () {
//                                                     paymetnProvider
//                                                         .deletePaymentMethod();
//                                                   },
//                                                   child: GlobalText(
//                                                     text: 'Delete',
//                                                     color: appColor.blackColor
//                                                         .withOpacity(0.66),
//                                                     fontSize: 14,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             heighSpacer(8),
//                                             Container(
//                                               height: setCurrentHeight(63),
//                                               width: double.infinity,
//                                               decoration: BoxDecoration(
//                                                 color: appColor.whiteColor,
//                                                 border: Border.all(
//                                                   color: appColor.yellowColor,
//                                                   width: 2,
//                                                 ),
//                                               ),
//                                               child: Center(
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   children: [
//                                                     widthSpacer(14),
//                                                     GooglePayLogo(),
//                                                     widthSpacer(14),
//                                                     Spacer(),
//                                                     CheckCircleIcon(),
//                                                     widthSpacer(15),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 : Container(
//                                     height: setCurrentHeight(112),
//                                     width: double.infinity,
//                                     color: appColor.transparentColor,
//                                     child: Stack(
//                                       fit: StackFit.loose,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           children: [
//                                             GlobalText(
//                                               text: 'Current method',
//                                               color: appColor.blackColor
//                                                   .withOpacity(0.66),
//                                               fontSize: 16,
//                                             ),
//                                           ],
//                                         ),
//                                         Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.end,
//                                               children: [
//                                                 GestureDetector(
//                                                   onTap: () {
//                                                     errorMessageProvider
//                                                         .clearErrorMessage();
//                                                     _navigationService.navigateTo(
//                                                         name:
//                                                             kTopUpBankAccount);
//                                                   },
//                                                   child: GlobalText(
//                                                     text: 'Edit',
//                                                     color: appColor.yellowColor
//                                                         .withOpacity(0.66),
//                                                     fontSize: 14,
//                                                   ),
//                                                 ),
//                                                 widthSpacer(10),
//                                                 Container(
//                                                   height: setCurrentHeight(14),
//                                                   child: VerticalDivider(
//                                                     width: 1,
//                                                     thickness: 1,
//                                                     color:
//                                                         appColor.dividerColor,
//                                                   ),
//                                                 ),
//                                                 widthSpacer(10),
//                                                 GestureDetector(
//                                                   onTap: () {
//                                                     paymetnProvider
//                                                         .deletePaymentMethod();
//                                                   },
//                                                   child: GlobalText(
//                                                     text: 'Delete',
//                                                     color: appColor.blackColor
//                                                         .withOpacity(0.66),
//                                                     fontSize: 14,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             heighSpacer(8),
//                                             Container(
//                                               height: setCurrentHeight(63),
//                                               width: double.infinity,
//                                               decoration: BoxDecoration(
//                                                 color: appColor.whiteColor,
//                                                 border: Border.all(
//                                                   color: appColor.yellowColor,
//                                                   width: 2,
//                                                 ),
//                                               ),
//                                               child: Center(
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   children: [
//                                                     widthSpacer(14),
//                                                     MasterCardIcon(),
//                                                     widthSpacer(14),
//                                                     Column(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         GlobalText(
//                                                           text: paymetnProvider
//                                                               .selectedPaymentDetailsModel
//                                                               .cardNumber!,
//                                                           color: appColor
//                                                               .blackColor
//                                                               .withOpacity(
//                                                                   0.66),
//                                                           fontSize: 14,
//                                                         ),
//                                                         GlobalText(
//                                                           text: paymetnProvider
//                                                               .selectedPaymentDetailsModel
//                                                               .exipryDate!,
//                                                           color: appColor
//                                                               .blackColor
//                                                               .withOpacity(0.5),
//                                                           fontSize: 14,
//                                                         ),
//                                                       ],
//                                                     ),
//                                                     Spacer(),
//                                                     CheckCircleIcon(),
//                                                     widthSpacer(15),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                     heighSpacer(38),
//                     Row(
//                       children: [
//                         // widthSpacer(5),
//                         GlobalText(
//                           text: 'Top up my wallet',
//                           color: appColor.blackColor.withOpacity(0.66),
//                         ),
//                       ],
//                     ),
//                     heighSpacer(23),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: setCurrentWidth(135),
//                           // height: 100,
//                           // color: Colors.red,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   GlobalText(
//                                     text: 'Enter amount:',
//                                     isBold: true,
//                                     isFredokaOne: false,
//                                     fontSize: 16,
//                                   ),
//                                 ],
//                               ),
//                               heighSpacer(5),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     flex: 1,
//                                     child: TextField(
//                                       // au: false,
//                                       style: GoogleFonts.fredokaOne(
//                                         color: appColor.blackColor,
//                                         fontSize: 18,
//                                       ),
//                                       decoration: InputDecoration(
//                                         alignLabelWithHint: false,
//                                         contentPadding: EdgeInsets.fromLTRB(
//                                             setCurrentWidth(16),
//                                             setCurrentHeight(8),
//                                             8,
//                                             12),
//                                         fillColor: appColor.transparentColor,
//                                         filled: true,
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.transparent,
//                                           ),
//                                           borderRadius:
//                                               BorderRadius.circular(9),
//                                         ),
//                                         // hintText: "50",
//                                         hintStyle: GoogleFonts.fredokaOne(
//                                           color: appColor.blackColor
//                                               .withOpacity(0.3),
//                                           fontSize: 16,
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             color: Colors.transparent,
//                                           ),
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                         ),
//                                       ),
//                                       controller:
//                                           paymetnProvider.amountController,
//                                       autofocus: false,
//                                       cursorColor: appColor.blackColor,
//                                       textInputAction: TextInputAction.next,
//                                       keyboardType: TextInputType.number,
//                                       onChanged: (String val) {
//                                         print("length is ${val.trim().length}");
//                                         if (val.trim().length > 0) {
//                                           print(
//                                               "length is1 ${val.trim().length}");
//                                           dynamic result = double.tryParse(val);
//                                           if (result > 100000) {
//                                             paymetnProvider.amountController
//                                                 .clear();
//                                             paymetnProvider
//                                                 .setIsAmountValid(false);
//                                           } else {
//                                             paymetnProvider
//                                                 .setIsAmountValid(true);
//                                           }
//                                         } else if (val.trim().length == 0) {
//                                           paymetnProvider
//                                               .setIsAmountValid(false);
//                                         }
//                                       },
//                                     ),
//                                     // ),
//                                   ),
//                                   // Spacer(),
//                                   GlobalText(
//                                     text: 'AED',
//                                     isBold: true,
//                                     isFredokaOne: false,
//                                     fontSize: 20,
//                                   ),
//                                   widthSpacer(5),
//                                 ],
//                               ),
//                               // heighSpacer(5),
//                               Divider(
//                                 height: 1,
//                                 thickness: 3,
//                                 color: appColor.yellowColor,
//                               ),
//                             ],
//                           ),
//                         ),
//                         heighSpacer(14),
//                         GestureDetector(
//                           onTap: () async {
//                             await paymetnProvider.addAmount(context);
//                           },
//                           child: Container(
//                             height: setCurrentHeight(48),
//                             width: setCurrentWidth(146),
//                             color: appColor.yellowColor,
//                             child: Center(
//                               child: GlobalText(
//                                 text: "ADD AMOUNT",
//                                 fontSize: 16,
//                                 color: appColor.whiteColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     heighSpacer(58),
//                     Row(
//                       children: [
//                         // widthSpacer(5),
//                         GlobalText(
//                           text: 'Other payment methods',
//                           color: appColor.blackColor.withOpacity(0.66),
//                         ),
//                       ],
//                     ),
//                     heighSpacer(27),
//                     GestureDetector(
//                       onTap: () {
//                         paymetnProvider.setCardPaymentMethod();
//                       },
//                       child: PaymentContainer(
//                         text: 'Credit cards',
//                         icon: CreditCardIcon(),
//                         height: 63,
//                         isSelected: paymetnProvider.selectedPaymentMethod ==
//                             SelectedPaymentMethod.card,
//                       ),
//                     ),
//                     heighSpacer(18),
//                     GestureDetector(
//                       onTap: () {
//                         paymetnProvider.setAppltPaymentMethod();
//                       },
//                       child: PaymentContainer(
//                         text: 'Apple pay',
//                         icon: ApplyPayeIcon(),
//                         height: 63,
//                         isSelected: paymetnProvider.selectedPaymentMethod ==
//                             SelectedPaymentMethod.apple,
//                       ),
//                     ),
//                     heighSpacer(18),
//                     GestureDetector(
//                       onTap: () {
//                         paymetnProvider.setGooglePaymentMethod();
//                       },
//                       child: PaymentContainer(
//                         text: 'Google pay',
//                         icon: GooglePayIcon(),
//                         height: 63,
//                         isSelected: paymetnProvider.selectedPaymentMethod ==
//                             SelectedPaymentMethod.google,
//                       ),
//                     ),
//                     heighSpacer(17),
//                     GestureDetector(
//                       onTap: () {
//                         if (paymetnProvider.selectedPaymentMethod ==
//                             SelectedPaymentMethod.none) {
//                           errorMessageProvider.setErrorMessage(
//                               message: "Select payment method");
//                         } else {
//                           errorMessageProvider.clearErrorMessage();
//                           _navigationService.navigateTo(
//                               name: kTopUpBankAccount);
//                         }
//                       },
//                       child: Container(
//                         height: setCurrentHeight(63),
//                         width: double.infinity,
//                         color: appColor.yellowColor,
//                         child: Center(
//                           child: GlobalText(
//                             text: "ADD PAYMENT METHOD",
//                             fontSize: 22,
//                             color: appColor.whiteColor,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }),
//           ),
//           FinalErrorWidget(),
//           Consumer<PaymentProvider>(builder: (context, paymenProvider, _) {
//             return paymenProvider.isLoading
//                 ? GlobalLoading()
//                 : SizedBox.shrink();
//           }),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
import 'package:tipperapp/widgets/icons/payment_icons/hsbc_logo.dart';
import 'package:tipperapp/widgets/icons/payment_icons/master_card_icon.dart';
import 'package:tipperapp/widgets/loading/global_loading.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class TipperTopUpWalletPage extends StatelessWidget {
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
                    // heighSpacer(13),
                    // Row(
                    //   children: [
                    //     // widthSpacer(5),
                    //     GlobalText(
                    //       text: 'Payment methods',
                    //       color: appColor.blackColor.withOpacity(0.66),
                    //     ),
                    //   ],
                    // ),
                    // heighSpacer(27),
                    // paymetnProvider.selectedPaymentMethod ==
                    //         SelectedPaymentMethod.none
                    //     ? Container(
                    //         height: setCurrentHeight(112),
                    //         width: double.infinity,
                    //         color: appColor.transparentColor,
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.start,
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             Row(
                    //               mainAxisAlignment: MainAxisAlignment.start,
                    //               children: [
                    //                 GlobalText(
                    //                   text: 'Current method',
                    //                   color:
                    //                       appColor.blackColor.withOpacity(0.66),
                    //                   fontSize: 16,
                    //                 ),
                    //               ],
                    //             ),
                    //             heighSpacer(30),
                    //             GlobalText(
                    //               text: 'No selected payment method',
                    //               color: appColor.blackColor.withOpacity(0.66),
                    //               fontSize: 16,
                    //             ),
                    //           ],
                    //         ),
                    //       )
                    //     : paymetnProvider.selectedPaymentMethod ==
                    //             SelectedPaymentMethod.apple
                    //         ? Container(
                    //             height: setCurrentHeight(112),
                    //             width: double.infinity,
                    //             child: Stack(
                    //               fit: StackFit.loose,
                    //               children: [
                    //                 Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.start,
                    //                   children: [
                    //                     GlobalText(
                    //                       text: 'Current method',
                    //                       color: appColor.blackColor
                    //                           .withOpacity(0.66),
                    //                       fontSize: 16,
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 Column(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.start,
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   children: [
                    //                     Row(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.end,
                    //                       children: [
                    //                         GestureDetector(
                    //                           onTap: () {},
                    //                           child: GlobalText(
                    //                             text: 'Edit',
                    //                             color: appColor.yellowColor
                    //                                 .withOpacity(0.66),
                    //                             fontSize: 14,
                    //                           ),
                    //                         ),
                    //                         widthSpacer(10),
                    //                         Container(
                    //                           height: setCurrentHeight(14),
                    //                           child: VerticalDivider(
                    //                             width: 1,
                    //                             thickness: 1,
                    //                             color: appColor.dividerColor,
                    //                           ),
                    //                         ),
                    //                         widthSpacer(10),
                    //                         GestureDetector(
                    //                           onTap: () {
                    //                             paymetnProvider
                    //                                 .deletePaymentMethod();
                    //                           },
                    //                           child: GlobalText(
                    //                             text: 'Delete',
                    //                             color: appColor.blackColor
                    //                                 .withOpacity(0.66),
                    //                             fontSize: 14,
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                     heighSpacer(8),
                    //                     Container(
                    //                       height: setCurrentHeight(63),
                    //                       width: double.infinity,
                    //                       decoration: BoxDecoration(
                    //                         color: appColor.whiteColor,
                    //                         border: Border.all(
                    //                           color: appColor.yellowColor,
                    //                           width: 2,
                    //                         ),
                    //                       ),
                    //                       child: Center(
                    //                         child: Row(
                    //                           mainAxisAlignment:
                    //                               MainAxisAlignment.start,
                    //                           children: [
                    //                             widthSpacer(14),
                    //                             ApplePayLogo(),
                    //                             widthSpacer(14),
                    //                             Spacer(),
                    //                             CheckCircleIcon(),
                    //                             widthSpacer(15),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ],
                    //             ),
                    //           )
                    //         : paymetnProvider.selectedPaymentMethod ==
                    //                 SelectedPaymentMethod.google
                    //             ? Container(
                    //                 height: setCurrentHeight(112),
                    //                 width: double.infinity,
                    //                 child: Stack(
                    //                   fit: StackFit.loose,
                    //                   children: [
                    //                     Row(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.start,
                    //                       children: [
                    //                         GlobalText(
                    //                           text: 'Current method',
                    //                           color: appColor.blackColor
                    //                               .withOpacity(0.66),
                    //                           fontSize: 16,
                    //                         ),
                    //                       ],
                    //                     ),
                    //                     Column(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.start,
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.start,
                    //                       children: [
                    //                         Row(
                    //                           mainAxisAlignment:
                    //                               MainAxisAlignment.end,
                    //                           children: [
                    //                             GestureDetector(
                    //                               onTap: () {},
                    //                               child: GlobalText(
                    //                                 text: 'Edit',
                    //                                 color: appColor.yellowColor
                    //                                     .withOpacity(0.66),
                    //                                 fontSize: 14,
                    //                               ),
                    //                             ),
                    //                             widthSpacer(10),
                    //                             Container(
                    //                               height: setCurrentHeight(14),
                    //                               child: VerticalDivider(
                    //                                 width: 1,
                    //                                 thickness: 1,
                    //                                 color:
                    //                                     appColor.dividerColor,
                    //                               ),
                    //                             ),
                    //                             widthSpacer(10),
                    //                             GestureDetector(
                    //                               onTap: () {
                    //                                 paymetnProvider
                    //                                     .deletePaymentMethod();
                    //                               },
                    //                               child: GlobalText(
                    //                                 text: 'Delete',
                    //                                 color: appColor.blackColor
                    //                                     .withOpacity(0.66),
                    //                                 fontSize: 14,
                    //                               ),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                         heighSpacer(8),
                    //                         Container(
                    //                           height: setCurrentHeight(63),
                    //                           width: double.infinity,
                    //                           decoration: BoxDecoration(
                    //                             color: appColor.whiteColor,
                    //                             border: Border.all(
                    //                               color: appColor.yellowColor,
                    //                               width: 2,
                    //                             ),
                    //                           ),
                    //                           child: Center(
                    //                             child: Row(
                    //                               mainAxisAlignment:
                    //                                   MainAxisAlignment.start,
                    //                               children: [
                    //                                 widthSpacer(14),
                    //                                 GooglePayLogo(),
                    //                                 widthSpacer(14),
                    //                                 Spacer(),
                    //                                 CheckCircleIcon(),
                    //                                 widthSpacer(15),
                    //                               ],
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ],
                    //                 ),
                    //               )
                    //             : Container(
                    //                 height: setCurrentHeight(112),
                    //                 width: double.infinity,
                    //                 color: appColor.transparentColor,
                    //                 child: Stack(
                    //                   fit: StackFit.loose,
                    //                   children: [
                    //                     Row(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.start,
                    //                       children: [
                    //                         GlobalText(
                    //                           text: 'Current method',
                    //                           color: appColor.blackColor
                    //                               .withOpacity(0.66),
                    //                           fontSize: 16,
                    //                         ),
                    //                       ],
                    //                     ),
                    //                     Column(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.start,
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.start,
                    //                       children: [
                    //                         Row(
                    //                           mainAxisAlignment:
                    //                               MainAxisAlignment.end,
                    //                           children: [
                    //                             GestureDetector(
                    //                               onTap: () {
                    //                                 errorMessageProvider
                    //                                     .clearErrorMessage();
                    //                                 _navigationService.navigateTo(
                    //                                     name:
                    //                                         kTopUpBankAccount);
                    //                               },
                    //                               child: GlobalText(
                    //                                 text: 'Edit',
                    //                                 color: appColor.yellowColor
                    //                                     .withOpacity(0.66),
                    //                                 fontSize: 14,
                    //                               ),
                    //                             ),
                    //                             widthSpacer(10),
                    //                             Container(
                    //                               height: setCurrentHeight(14),
                    //                               child: VerticalDivider(
                    //                                 width: 1,
                    //                                 thickness: 1,
                    //                                 color:
                    //                                     appColor.dividerColor,
                    //                               ),
                    //                             ),
                    //                             widthSpacer(10),
                    //                             GestureDetector(
                    //                               onTap: () {
                    //                                 paymetnProvider
                    //                                     .deletePaymentMethod();
                    //                               },
                    //                               child: GlobalText(
                    //                                 text: 'Delete',
                    //                                 color: appColor.blackColor
                    //                                     .withOpacity(0.66),
                    //                                 fontSize: 14,
                    //                               ),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                         heighSpacer(8),
                    //                         Container(
                    //                           height: setCurrentHeight(63),
                    //                           width: double.infinity,
                    //                           decoration: BoxDecoration(
                    //                             color: appColor.whiteColor,
                    //                             border: Border.all(
                    //                               color: appColor.yellowColor,
                    //                               width: 2,
                    //                             ),
                    //                           ),
                    //                           child: Center(
                    //                             child: Row(
                    //                               mainAxisAlignment:
                    //                                   MainAxisAlignment.start,
                    //                               children: [
                    //                                 widthSpacer(14),
                    //                                 MasterCardIcon(),
                    //                                 widthSpacer(14),
                    //                                 Column(
                    //                                   mainAxisAlignment:
                    //                                       MainAxisAlignment
                    //                                           .center,
                    //                                   children: [
                    //                                     GlobalText(
                    //                                       text: paymetnProvider
                    //                                           .selectedPaymentDetailsModel
                    //                                           .cardNumber!,
                    //                                       color: appColor
                    //                                           .blackColor
                    //                                           .withOpacity(
                    //                                               0.66),
                    //                                       fontSize: 14,
                    //                                     ),
                    //                                     GlobalText(
                    //                                       text: paymetnProvider
                    //                                           .selectedPaymentDetailsModel
                    //                                           .exipryDate!,
                    //                                       color: appColor
                    //                                           .blackColor
                    //                                           .withOpacity(0.5),
                    //                                       fontSize: 14,
                    //                                     ),
                    //                                   ],
                    //                                 ),
                    //                                 Spacer(),
                    //                                 CheckCircleIcon(),
                    //                                 widthSpacer(15),
                    //                               ],
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    heighSpacer(27),
                    Row(
                      children: [
                        // widthSpacer(5),
                        GlobalText(
                          text: 'Top up my wallet',
                          color: appColor.blackColor.withOpacity(0.66),
                        ),
                      ],
                    ),
                    heighSpacer(23),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: setCurrentWidth(135),
                          // height: 100,
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GlobalText(
                                    text: 'Enter amount:',
                                    isBold: true,
                                    isFredokaOne: false,
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                              heighSpacer(5),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: TextField(
                                      // au: false,
                                      style: GoogleFonts.fredokaOne(
                                        color: appColor.blackColor,
                                        fontSize: 18,
                                      ),
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
                                          borderRadius:
                                              BorderRadius.circular(9),
                                        ),
                                        // hintText: "50",
                                        hintStyle: GoogleFonts.fredokaOne(
                                          color: appColor.blackColor
                                              .withOpacity(0.3),
                                          fontSize: 16,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      controller:
                                          paymetnProvider.amountController,
                                      autofocus: false,
                                      cursorColor: appColor.blackColor,
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      onChanged: (String val) {
                                        print("length is ${val.trim().length}");
                                        if (val.trim().length > 0) {
                                          print(
                                              "length is1 ${val.trim().length}");
                                          dynamic result = double.tryParse(val);
                                          if (result > 100000) {
                                            paymetnProvider.amountController
                                                .clear();
                                            paymetnProvider
                                                .setIsAmountValid(false);
                                          } else {
                                            paymetnProvider
                                                .setIsAmountValid(true);
                                          }
                                        } else if (val.trim().length == 0) {
                                          paymetnProvider
                                              .setIsAmountValid(false);
                                        }
                                      },
                                    ),
                                    // ),
                                  ),
                                  // Spacer(),
                                  GlobalText(
                                    text: 'AED',
                                    isBold: true,
                                    isFredokaOne: false,
                                    fontSize: 20,
                                  ),
                                  widthSpacer(5),
                                ],
                              ),
                              // heighSpacer(5),
                              Divider(
                                height: 1,
                                thickness: 3,
                                color: appColor.yellowColor,
                              ),
                            ],
                          ),
                        ),
                        heighSpacer(14),
                        GestureDetector(
                          onTap: () async {
                            await paymetnProvider.addAmount(context);
                          },
                          child: Container(
                            height: setCurrentHeight(48),
                            width: setCurrentWidth(146),
                            color: appColor.yellowColor,
                            child: Center(
                              child: GlobalText(
                                text: "ADD AMOUNT",
                                fontSize: 16,
                                color: appColor.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    heighSpacer(58),
                    Container(
                      height: setCurrentHeight(112),
                      width: double.infinity,
                      color: appColor.transparentColor,
                      child: Stack(
                        fit: StackFit.loose,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GlobalText(
                                text: 'Current method',
                                color: appColor.blackColor.withOpacity(0.66),
                                // fontSize: 16,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: setCurrentHeight(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        errorMessageProvider
                                            .clearErrorMessage();
                                        if (paymetnProvider
                                                .selectedPaymentMethod ==
                                            SelectedPaymentMethod.card) {
                                          _navigationService.navigateTo(
                                              name: kTopUCardAccount);
                                        } else {
                                          _navigationService.navigateTo(
                                              name: kTopUBankAccount);
                                        }
                                      },
                                      child: GlobalText(
                                        text: 'Edit',
                                        color: appColor.yellowColor
                                            .withOpacity(0.66),
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
                                      },
                                      child: GlobalText(
                                        text: 'Delete',
                                        color: appColor.blackColor
                                            .withOpacity(0.66),
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
                                        paymetnProvider.selectedPaymentMethod ==
                                                SelectedPaymentMethod.card
                                            ? MasterCardIcon()
                                            : HSBCLogo(
                                                height: 63,
                                              ),
                                        widthSpacer(14),
                                        GlobalText(
                                          text: paymetnProvider
                                                      .selectedPaymentMethod ==
                                                  SelectedPaymentMethod.card
                                              ? paymetnProvider
                                                          .selectedPaymentDetailsModel
                                                          .cardNumber ==
                                                      ""
                                                  ? "42424 **** **** 424242"
                                                  : paymetnProvider
                                                      .selectedPaymentDetailsModel
                                                      .cardNumber!
                                              : paymetnProvider
                                                          .isConfirmIbanPressed &&
                                                      paymetnProvider
                                                              .ibanNumberController
                                                              .text
                                                              .trim()
                                                              .length !=
                                                          0
                                                  ? paymetnProvider
                                                      .ibanNumberController.text
                                                      .replaceAll(regex, '*')
                                                  : "000 **** ****",
                                          color: appColor.blackColor
                                              .withOpacity(0.66),
                                          fontSize: 14,
                                        ),
                                        Spacer(),
                                        CheckCircleIcon(),
                                        widthSpacer(15),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    heighSpacer(10),
                    Row(
                      children: [
                        GlobalText(
                          text: 'Other payment methods',
                          color: appColor.blackColor.withOpacity(0.66),
                        ),
                      ],
                    ),
                    heighSpacer(27),
                    GestureDetector(
                      onTap: () {
                        paymetnProvider.setCardPaymentMethod();
                      },
                      child: PaymentContainer(
                        text: 'Credit cards',
                        icon: CreditCardIcon(),
                        isSelected: paymetnProvider.selectedPaymentMethod ==
                            SelectedPaymentMethod.card,
                      ),
                    ),
                    heighSpacer(18),
                    GestureDetector(
                      onTap: () {
                        paymetnProvider.setHSBCPaymentMethod();
                      },
                      child: PaymentContainer(
                        text: 'Bank account',
                        icon: HSBCLogo(),
                        isSelected: paymetnProvider.selectedPaymentMethod ==
                            SelectedPaymentMethod.hsbc,
                        // height: 60,
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     paymetnProvider.setHSBCPaymentMethod();
                    //   },
                    //   child: Container(
                    //     height: setCurrentHeight(63),
                    //     width: double.infinity,
                    //     color: appColor.transparentColor,
                    //     child: Stack(
                    //       fit: StackFit.loose,
                    //       children: [
                    //         Column(
                    //           mainAxisAlignment: MainAxisAlignment.start,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Container(
                    //               height: setCurrentHeight(63),
                    //               width: double.infinity,
                    //               decoration: BoxDecoration(
                    //                 color: appColor.whiteColor,
                    //                 border: Border.all(
                    //                   color: paymetnProvider
                    //                               .selectedPaymentMethod ==
                    //                           SelectedPaymentMethod.hsbc
                    //                       ? appColor.yellowColor
                    //                       : appColor.transparentColor,
                    //                   width: 2,
                    //                 ),
                    //               ),
                    //               child: Center(
                    //                 child: Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.start,
                    //                   children: [
                    //                     widthSpacer(14),
                    //                     HSBCLogo(),
                    //                     widthSpacer(14),
                    //                     GlobalText(
                    //                       text: paymetnProvider
                    //                                   .selectedPaymentMethod ==
                    //                               SelectedPaymentMethod.hsbc
                    //                           ? "0000 **** ****"
                    //                           : "",
                    //                       color: appColor.blackColor
                    //                           .withOpacity(0.66),
                    //                       fontSize: 14,
                    //                     ),
                    //                     Spacer(),
                    //                     paymetnProvider.selectedPaymentMethod ==
                    //                             SelectedPaymentMethod.hsbc
                    //                         ? CheckCircleIcon()
                    //                         : SizedBox.shrink(),
                    //                     widthSpacer(15),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    heighSpacer(18),
                    PaymentContainer(
                      text: 'Google pay',
                      icon: GooglePayIcon(),
                    ),
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
                    //                   // widthSpacer(14),
                    //                   // Column(
                    //                   //   mainAxisAlignment:
                    //                   //       MainAxisAlignment.center,
                    //                   //   children: [
                    //                   //     GlobalText(
                    //                   //       text: paymetnProvider
                    //                   //           .selectedPaymentDetailsModel
                    //                   //           .cardNumber!,
                    //                   //       color: appColor.blackColor
                    //                   //           .withOpacity(0.66),
                    //                   //       fontSize: 14,
                    //                   //     ),
                    //                   //     GlobalText(
                    //                   //       text: paymetnProvider
                    //                   //           .selectedPaymentDetailsModel
                    //                   //           .exipryDate!,
                    //                   //       color: appColor.blackColor
                    //                   //           .withOpacity(0.5),
                    //                   //       fontSize: 14,
                    //                   //     ),
                    //                   //   ],
                    //                   // ),
                    //                   // GlobalText(
                    //                   //   text: "0000 **** ****",
                    //                   //   color: appColor.blackColor
                    //                   //       .withOpacity(0.66),
                    //                   //   fontSize: 14,
                    //                   // ),
                    //                   // Spacer(),
                    //                   // CheckCircleIcon(),
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
                    heighSpacer(18),
                    PaymentContainer(
                      text: 'Apple pay',
                      icon: ApplyPayeIcon(),
                    ),
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
                    //                   // widthSpacer(14),
                    //                   // Column(
                    //                   //   mainAxisAlignment:
                    //                   //       MainAxisAlignment.center,
                    //                   //   children: [
                    //                   //     GlobalText(
                    //                   //       text: paymetnProvider
                    //                   //           .selectedPaymentDetailsModel
                    //                   //           .cardNumber!,
                    //                   //       color: appColor.blackColor
                    //                   //           .withOpacity(0.66),
                    //                   //       fontSize: 14,
                    //                   //     ),
                    //                   //     GlobalText(
                    //                   //       text: paymetnProvider
                    //                   //           .selectedPaymentDetailsModel
                    //                   //           .exipryDate!,
                    //                   //       color: appColor.blackColor
                    //                   //           .withOpacity(0.5),
                    //                   //       fontSize: 14,
                    //                   //     ),
                    //                   //   ],
                    //                   // ),
                    //                   // GlobalText(
                    //                   //   text: "0000 **** ****",
                    //                   //   color: appColor.blackColor
                    //                   //       .withOpacity(0.66),
                    //                   //   fontSize: 14,
                    //                   // ),
                    //                   // Spacer(),
                    //                   // CheckCircleIcon(),
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
                    heighSpacer(17),
                    // GestureDetector(
                    //   onTap: () {
                    //     if (paymetnProvider.selectedPaymentMethod ==
                    //         SelectedPaymentMethod.none) {
                    //       errorMessageProvider.setErrorMessage(
                    //           message: "Select payment method");
                    //     } else {
                    //       errorMessageProvider.clearErrorMessage();
                    //       _navigationService.navigateTo(
                    //           name: kTopUpBankAccount);
                    //     }
                    //   },
                    //   child: Container(
                    //     height: setCurrentHeight(63),
                    //     width: double.infinity,
                    //     color: appColor.yellowColor,
                    //     child: Center(
                    //       child: GlobalText(
                    //         text: "ADD PAYMENT METHOD",
                    //         fontSize: 22,
                    //         color: appColor.whiteColor,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
            }),
          ),
          FinalErrorWidget(),
          Consumer<PaymentProvider>(builder: (context, paymenProvider, _) {
            return paymenProvider.isLoading
                ? GlobalLoading()
                : SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
