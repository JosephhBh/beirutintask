import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/controller/provider/tipping_provider/tipping_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/buttons/payment_button.dart';
import 'package:tipperapp/widgets/error_widgets/final_error_widget.dart';
import 'package:tipperapp/widgets/icons/back_icon.dart';
import 'package:tipperapp/widgets/icons/user_icon.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class TippingPage extends StatefulWidget {
  @override
  State<TippingPage> createState() => _TippingPageState();
}

class _TippingPageState extends State<TippingPage> {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
    // FocusScope.of(context).requestFocus(new FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    var authenticationProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return GlobalScaffold(
      backgroundColor: appColor.greyColor,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            height: setCurrentHeight(404),
            width: double.infinity,
            color: appColor.whiteColor,
          ),
          applyPadding(
            15,
            13,
            0,
            0,
            Stack(
              fit: StackFit.loose,
              children: [
                GestureDetector(
                  onTap: () {
                    _navigationService.pop();
                  },
                  child: Container(
                    color: appColor.transparentColor,
                    height: setCurrentHeight(70),
                    child: Row(
                      children: [
                        BackIcon(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          applyPadding(
            52,
            0,
            0,
            0,
            Align(
              alignment: Alignment.topCenter,
              child: Consumer<TippingProvider>(
                  builder: (context, tippingProvider, _) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GlobalText(
                        text: 'Enter Amount',
                      ),
                      heighSpacer(40),
                      Container(
                        height: setCurrentHeight(30),
                        child: MediaQuery.removePadding(
                          context: context,
                          removeBottom: true,
                          removeLeft: true,
                          removeRight: true,
                          removeTop: true,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: tippingAmount.length,
                            separatorBuilder: (context, index) => SizedBox(
                              width: setCurrentWidth(10),
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  tippingProvider
                                      .setSelectedAmount(tippingAmount[index]);
                                },
                                child: Container(
                                  width: setCurrentWidth(90),
                                  decoration: BoxDecoration(
                                    color: appColor.transparentColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: tippingProvider.selectedAmount ==
                                              tippingAmount[index]
                                          ? appColor.yellowColor
                                          : appColor.transparentColor,
                                      width: 2,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GlobalText(
                                        text: tippingAmount[index].toString(),
                                      ),
                                      widthSpacer(3),
                                      GlobalText(
                                        text: 'AED',
                                        // isBold: true,
                                        // isFredokaOne: false,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      heighSpacer(40),
                      GestureDetector(
                        onTap: () {
                          tippingProvider.toggleIsOtherAmountSelected();
                        },
                        child: Container(
                          width: setCurrentWidth(135),
                          decoration: BoxDecoration(
                            color: appColor.transparentColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: tippingProvider.isOtherAmountSelected
                                  ? appColor.yellowColor
                                  : appColor.transparentColor,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GlobalText(
                                  text: 'Other amount:',
                                  isBold: true,
                                  isFredokaOne: false,
                                  fontSize: 16,
                                ),
                                heighSpacer(10),
                                // GlobalText(
                                //   text: '50 AED',
                                //   isBold: true,
                                //   isFredokaOne: false,
                                //   fontSize: 20,
                                // ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Focus(
                                        // focusNode: FocusNode(
                                        //   canRequestFocus: false,
                                        // ),
                                        onFocusChange: (focus) {
                                          if (tippingProvider
                                                  .isOtherAmountSelected ==
                                              false) {
                                            tippingProvider
                                                .toggleIsOtherAmountSelected();
                                          }
                                        },
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
                                            hintText: "50",
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
                                              tippingProvider.otherAmount,
                                          autofocus: false,
                                          cursorColor: appColor.blackColor,
                                          textInputAction: TextInputAction.next,
                                          keyboardType: TextInputType.number,
                                          onChanged: (val) {
                                            dynamic result =
                                                double.tryParse(val);
                                            if (result > 100) {
                                              tippingProvider.otherAmount
                                                  .clear();
                                            }
                                            print("the result $result");
                                          },
                                        ),
                                      ),
                                    ),
                                    // Spacer(),
                                    GlobalText(
                                      text: 'AED',
                                      isBold: true,
                                      isFredokaOne: false,
                                      fontSize: 20,
                                    ),
                                  ],
                                ),
                                heighSpacer(10),
                                Divider(
                                  height: 1,
                                  thickness: 2,
                                  color: appColor.yellowColor,
                                ),
                                heighSpacer(10),
                                GlobalText(
                                  text: 'MAX 100 AED',
                                  isBold: true,
                                  isFredokaOne: false,
                                  fontSize: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          applyPadding(
            404,
            0,
            0,
            0,
            Consumer<TippingProvider>(builder: (context, tippingProvider, _) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    applyPadding(
                      0,
                      39,
                      39,
                      0,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          heighSpacer(27),
                          GlobalText(
                            text: 'RECEIVER:',
                            isBold: true,
                            isFredokaOne: false,
                            fontSize: 16,
                            color: appColor.blackColor.withOpacity(0.66),
                          ),
                          heighSpacer(20),
                          Container(
                            height: setCurrentHeight(209),
                            width: double.infinity,
                            color: appColor.whiteColor,
                            child: Stack(
                              fit: StackFit.loose,
                              children: [
                                applyPadding(
                                  16,
                                  15,
                                  0,
                                  0,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      UserIcon(),
                                      widthSpacer(5),
                                      GlobalText(
                                        text: tippingProvider
                                            .selectedReceiver.username!,
                                      ),
                                      Icon(
                                        Icons.verified,
                                        size: 20,
                                        color: appColor.darkBlueColor,
                                      ),
                                    ],
                                  ),
                                ),
                                applyPadding(
                                  22,
                                  0,
                                  15,
                                  0,
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: setCurrentWidth(108),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          QrImage(
                                            backgroundColor:
                                                appColor.transparentColor,
                                            foregroundColor:
                                                appColor.darkBlueColor,
                                            data: tippingProvider
                                                .selectedReceiver.id!,
                                            version: QrVersions.auto,
                                          ),
                                          // heighSpacer(2),
                                          GlobalText(
                                            text: "Code:" +
                                                tippingProvider
                                                    .selectedReceiver.id!
                                                    .substring(4),
                                            isFredokaOne: false,
                                            showEllipsis: false,
                                            fontSize: 12,
                                            color: appColor.darkBlueColor,
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
                    ),
                    // Spacer(),
                    applyPadding(
                      159,
                      22,
                      22,
                      0,
                      PaymentButton(
                        onPressed: () async {
                          await tippingProvider.tipWorker(
                            context,
                          );
                          // authenticationProvider.tipperModel.copyWith(
                          //   balance: 30,
                          // );
                          // authenticationProvider.updateTipperModel(
                          //     authenticationProvider.tipperModel.copyWith(
                          //   balance: 30,
                          // ));
                          // _navigationService.pop();
                        },
                      ),
                    ),
                    heighSpacer(27),
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
