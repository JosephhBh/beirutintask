import 'package:flutter/material.dart';
import 'package:tipperapp/core/constants/route_names.dart';
import 'package:tipperapp/core/view/about_us_screen.dart';
import 'package:tipperapp/core/view/sign_up_page.dart';
import 'package:tipperapp/reciever/view/receiver_profile/receiver_account_settings.dart';

import 'package:tipperapp/reciever/view/receiver_notification_page/receiver_all_notifications_page.dart';
import 'package:tipperapp/reciever/view/receiver_notification_page/receiver_notification_detail_page.dart';
import 'package:tipperapp/reciever/view/receiver_profile/receiver_wallet_page.dart';
import 'package:tipperapp/reciever/view/receiver_root_page.dart';
import 'package:tipperapp/reciever/view/receiver_profile/receiver_transactions.dart';
import 'package:tipperapp/root_page.dart';
import 'package:tipperapp/starting_screen.dart';
import 'package:tipperapp/tipper/view/tipper_profile/tipper_account_settings.dart';
import 'package:tipperapp/tipper/view/tipper_profile/tipper_transactions.dart';
import 'package:tipperapp/tipper/view/tipper_profile/tipper_wallet_page.dart';
import 'package:tipperapp/tipper/view/tipping_pages/payment_success_page.dart';
import 'package:tipperapp/tipper/view/tipping_pages/tipping_page.dart';
import 'package:tipperapp/tipper/view/tipper_notifications/tipper_all_notifications.dart';
import 'package:tipperapp/tipper/view/tipper_root_page.dart';
import 'package:tipperapp/tipper/view/tipping_pages/qr_page.dart';
import 'package:tipperapp/tipper/view/top_up_wallet/top_up_bank.dart';

import 'package:tipperapp/tipper/view/top_up_wallet/top_up_wallet.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case kStartingScreen:
      return _fadeRoute(
        settings.name,
        StartingScreen(),
      );

    case kRootPage:
      return _fadeRoute(
        settings.name,
        RootPage(),
      );

    case kReceiverRootPage:
      return _fadeRoute(
        settings.name,
        ReceiverRootPage(),
      );

    case kReceiverAllNotificationsPage:
      return _fadeRoute(
        settings.name,
        ReceiverAllNotificationsPage(),
      );
    case kReceiverNotificationsDetailPage:
      return _fadeRoute(
        settings.name,
        ReceiverNotificationDetailsPage(
          data: settings.arguments,
        ),
      );

    case kSignUpPage:
      return _fadeRoute(
        settings.name,
        SignUpPage(),
      );

    case kTipperRootPage:
      return _fadeRoute(
        settings.name,
        TipperRootPage(),
      );

    case kTopUpWallet:
      return _fadeRoute(
        settings.name,
        TopUpWallet(),
      );

    case kTopUpBankAccount:
      return _fadeRoute(
        settings.name,
        TopUpBank(),
      );

    case kTipperAllNotificationsPage:
      return _fadeRoute(
        settings.name,
        TipperAllNotificationsPage(),
      );

    case kQrPage:
      return _fadeRoute(
        settings.name,
        QrPage(),
      );

    case kTippingPage:
      return _fadeRoute(
        settings.name,
        TippingPage(),
      );

    case kPaymentSuccessPage:
      return _fadeRoute(
        settings.name,
        PaymentSuccessPage(),
      );

    case kTipperTransactions:
      return _fadeRoute(
        settings.name,
        TipperTransactions(),
      );

    case kReceiverTransaction:
      return _fadeRoute(
        settings.name,
        ReceiverTransactions(),
      );

    case kTipperAccountSettings:
      return _fadeRoute(
        settings.name,
        TipperAccountSettings(),
      );
    case kReceiverAccountSettings:
      return _fadeRoute(
        settings.name,
        ReceiverAccountSettings(),
      );
    case kAboutUsPage:
      return _fadeRoute(
        settings.name,
        AboutUsPage(),
      );
    case kTipperWalletPage:
      return _fadeRoute(
        settings.name,
        TipperWalletPage(),
      );
    case kReceiverWalletPage:
      return _fadeRoute(
        settings.name,
        ReceiverWalletPage(),
      );
    default:
      return _errorRoute();
  }
}

Route<dynamic> _fadeRoute(var name, Widget widget) {
  return PageRouteBuilder(
    opaque: true,
    transitionDuration: Duration(milliseconds: 300),
    reverseTransitionDuration: Duration(milliseconds: 300),
    settings: RouteSettings(
      name: name,
    ),
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

Route<dynamic> _errorRoute() {
  // FirebaseAuth _auth = FirebaseAuth.instance;
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Navigation Error',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Error check navigation option',
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  });
}
