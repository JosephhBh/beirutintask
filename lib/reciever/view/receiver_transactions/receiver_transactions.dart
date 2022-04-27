import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/controller/provider/authenticaion_provider/authentication_provider.dart';
import 'package:tipperapp/core/controller/services/transactions_service/transactions_service.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';

class ReceiverTransactions extends StatelessWidget {
  final TransactionsService _transactionsService =
      locator<TransactionsService>();

  @override
  Widget build(BuildContext context) {
    var authenticationProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    return GlobalScaffold(
      backgroundColor: appColor.greyColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: _transactionsService.getTransactions(
                  authenticationProvider.receiverModel.userId!),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return Column(
                            children: [
                              Text(
                                data['id'].toString(),
                              ),
                              Divider(
                                height: 1,
                                thickness: 1,
                                color: appColor.yellowColor,
                              ),
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
    );
  }
}
