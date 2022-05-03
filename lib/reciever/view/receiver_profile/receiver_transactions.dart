import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/controller/services/transactions_service/transactions_service.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/icons/back_icon_withcolor.dart';
import 'package:tipperapp/widgets/icons/user_icon.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class ReceiverTransactions extends StatelessWidget {
  final TransactionsService _transactionsService =
      locator<TransactionsService>();
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    var authenticationProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return GlobalScaffold(
      backgroundColor: appColor.yellowColor,
      child: SingleChildScrollView(
        child: Stack(
          fit: StackFit.loose,
          children: [
            applyPadding(
              15,
              0,
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
                      // height: setCurrentHeight(70),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              widthSpacer(13),
                              BackIconWithColor(
                                color: appColor.whiteColor,
                              ),
                              // widthSpacer(15),

                              Spacer(),
                              GlobalText(
                                text: "hello, " +
                                    authenticationProvider
                                        .receiverModel.username!,
                                color: appColor.whiteColor,
                                fontSize: 16,
                              ),
                              widthSpacer(9),
                              authenticationProvider.receiverModel.imagePath ==
                                      ""
                                  ? UserIcon()
                                  : CircleAvatar(
                                      radius: setCurrentWidth(25),
                                      backgroundColor: appColor.greyColor,
                                      backgroundImage: NetworkImage(
                                          authenticationProvider
                                              .receiverModel.imagePath!),
                                    ),

                              widthSpacer(19),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            applyPadding(
              101,
              0,
              0,
              0,
              Container(
                height: setCurrentHeight(825),
                decoration: BoxDecoration(
                    color: appColor.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70),
                    )),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      heighSpacer(33),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          widthSpacer(33),
                          GlobalText(
                            text: 'Transactions',
                            color: appColor.blackColor.withOpacity(0.66),
                          ),
                        ],
                      ),
                      heighSpacer(43),
                      StreamBuilder(
                        stream: _transactionsService.getTransactions(
                            authenticationProvider.receiverModel.userId!),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                    Map<String, dynamic> data = document.data()!
                                        as Map<String, dynamic>;
                                    return Column(
                                      children: [
                                        Container(
                                          height: setCurrentHeight(53),
                                          width: double.infinity,
                                          color: appColor.greyColor,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                widthSpacer(40),
                                                GlobalText(
                                                  text: 'From ' +
                                                      data['tipper_name'],
                                                  color: appColor.blackColor
                                                      .withOpacity(0.66),
                                                  fontSize: 16,
                                                ),
                                                Spacer(),
                                                GlobalText(
                                                  text: "+ " +
                                                      data['amount']
                                                          .toString() +
                                                      " AED",
                                                  color: appColor.yellowColor,
                                                  fontSize: 16,
                                                ),
                                                widthSpacer(40),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Divider(
                                        //   height: 1,
                                        //   thickness: 0.4,
                                        //   color: appColor.dividerColor,
                                        // ),
                                        heighSpacer(10),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
