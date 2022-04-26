import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipperapp/core/controller/provider/tipping_provider/tipping_provider.dart';
import 'package:tipperapp/core/device_utils/device_utils.dart';
import 'package:tipperapp/core/navigation/navigation_service.dart';
import 'package:tipperapp/locator.dart';
import 'package:tipperapp/widgets/icons/check_icon.dart';
import 'package:tipperapp/widgets/scaffold/global_scaffold.dart';
import 'package:tipperapp/widgets/text/global_text.dart';

class PaymentSuccessPage extends StatefulWidget {
  const PaymentSuccessPage({Key? key}) : super(key: key);

  @override
  State<PaymentSuccessPage> createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  void initState() {
    super.initState();
    removeScreen();
  }

  removeScreen() async {
    await Future.delayed(Duration(seconds: 3), () {});
    var tippingProvider = Provider.of<TippingProvider>(context, listen: false);
    _navigationService.pop();
    tippingProvider.clearTippingProvider();
  }

  @override
  Widget build(BuildContext context) {
    var tippingProvider = Provider.of<TippingProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async => false,
      child: GlobalScaffold(
        backgroundColor: appColor.greyColor,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: setCurrentHeight(323),
                width: setCurrentWidth(323),
                decoration: BoxDecoration(
                  color: appColor.darkBlueColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: CheckIcon(),
                ),
              ),
              heighSpacer(60),
              GlobalText(
                text: 'PAYMENT SUCCESSFUL!',
                color: appColor.darkBlueColor,
              ),
              heighSpacer(20),
              GlobalText(
                text: tippingProvider.finalAmount.toString() +
                    ' AED has been transferred to',
                color: appColor.blackColor,
                fontSize: 18,
                isBold: true,
                isFredokaOne: false,
              ),
              heighSpacer(5),
              GlobalText(
                text: tippingProvider.selectedReceiver.username!,
                color: appColor.blackColor,
                fontSize: 18,
                isBold: true,
                isFredokaOne: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
