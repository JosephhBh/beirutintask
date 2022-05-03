import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/controller/services/transactions_service/transactions_service.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/icons/back_icon.dart';
import 'package:tipperapp/widgets/icons/payment_icons/user_icon_fill.dart';
import 'package:tipperapp/widgets/icons/user_icon.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class TipperWalletPage extends StatelessWidget {
  NumberFormat numberFormat = NumberFormat.decimalPattern('hi');
  final TransactionsService _transactionsService =
      locator<TransactionsService>();
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    var authenticationProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
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
            113,
            18,
            18,
            0,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    widthSpacer(5),
                    GlobalText(
                      text: "WALLET",
                    ),
                  ],
                ),
                heighSpacer(15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(41),
                  child: Container(
                    height: setCurrentHeight(239),
                    width: double.infinity,
                    // width: setCurrentWidth(200),
                    color: appColor.whiteColor,
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        applyPadding(
                          33,
                          31,
                          31,
                          0,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  authenticationProvider
                                              .tipperModel.imagePath ==
                                          ""
                                      ? UserIcon()
                                      : CircleAvatar(
                                          radius: setCurrentWidth(25),
                                          backgroundColor: appColor.greyColor,
                                          backgroundImage: NetworkImage(
                                              authenticationProvider
                                                  .tipperModel.imagePath!),
                                        ),
                                  Spacer(),
                                  GlobalText(
                                    text: authenticationProvider
                                            .tipperModel.username ??
                                        "",
                                  ),
                                ],
                              ),
                              heighSpacer(41),
                              GlobalText(
                                text: "Current Balance",
                                isBold: true,
                                isFredokaOne: false,
                                fontSize: 12,
                              ),
                              heighSpacer(7),
                              GlobalText(
                                text: authenticationProvider
                                            .tipperModel.balance ==
                                        null
                                    ? ""
                                    : numberFormat.format(authenticationProvider
                                            .tipperModel.balance) +
                                        " AED",
                                isFredokaOne: false,
                                fontSize: 30,
                                isBold: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          applyPadding(
            450,
            0,
            0,
            0,
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(54),
                topRight: Radius.circular(54),
              ),
              child: Container(
                height: double.maxFinite,
                width: double.infinity,
                color: appColor.yellowColor,
                child: applyPadding(
                  0,
                  42,
                  42,
                  0,
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        heighSpacer(29.5),
                        Container(
                          width: setCurrentWidth(68),
                          child: Divider(
                            height: 1,
                            thickness: 3,
                            color: appColor.greyColor,
                          ),
                        ),
                        heighSpacer(25.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GlobalText(
                              text: "Last transactions",
                              color: appColor.whiteColor,
                            ),
                          ],
                        ),
                        heighSpacer(30),
                        Column(
                          children: [
                            StreamBuilder(
                              stream: _transactionsService.getTransactions(
                                  authenticationProvider.tipperModel.userId!),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  return Container(
                                    height: 0,
                                    width: 0,
                                    // color: Colors.red,
                                  );
                                } else if (snapshot.hasData) {
                                  return Column(
                                    children: [
                                      ListView(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        children: snapshot.data!.docs
                                            .map((DocumentSnapshot document) {
                                          Map<String, dynamic> data = document
                                              .data()! as Map<String, dynamic>;
                                          return Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  UserIconFill(),
                                                  Spacer(),
                                                  GlobalText(
                                                    text: "- " +
                                                        data['amount']
                                                            .toString() +
                                                        " AED",
                                                    color: appColor.whiteColor,
                                                  ),
                                                ],
                                              ),
                                              heighSpacer(9),
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  );
                                }
                                return Container();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
